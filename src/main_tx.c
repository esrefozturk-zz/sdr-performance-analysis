#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <libbladeRF.h>
#include <math.h>
#include "config.h"
#include "transceive.h"
#include "utils.h"
#include <sys/time.h>

struct timeval t;


unsigned int samples_len = SAMPLE_SET_SIZE;
int16_t *tx_samples;
struct bladerf *devtx;


int main(int argc, char *argv[]) {
    int status=0;
    struct module_config config_rx;
    struct module_config config_tx;
    struct bladerf_devinfo dev_info;
    unsigned char header[8];        // data header
    unsigned char payload[PAYLOAD_LENGTH] = {0};      // data payload
    float complex
    y[BUFFER_SIZE];          // frame samples
    unsigned int buf_len = PAYLOAD_LENGTH;
    float complex
    buf[buf_len];
    unsigned int i;
    unsigned int symbol_len;
    int frame_complete = 0;
    int lastpos = 0;
    int cnt = 0;
    flexframegenprops_s ffp;


    bladerf_init_devinfo(&dev_info);
    strncpy(dev_info.serial, argv[1], sizeof(dev_info.serial) - 1);


    bladerf_open_with_devinfo(&devtx, &dev_info);
    bladerf_load_fpga(devtx, "./hostedx115-latest.rbf");

    config_rx.module = BLADERF_MODULE_RX;
    config_tx.module = BLADERF_MODULE_TX;
    config_tx.frequency = config_rx.frequency = FREQUENCY_USED;
    config_tx.bandwidth = config_rx.bandwidth = BANDWIDTH_USED;
    config_tx.samplerate = config_rx.samplerate = SAMPLING_RATE_USED;
    config_tx.rx_lna = config_rx.rx_lna = BLADERF_LNA_GAIN_MID;
    config_tx.vga1 = config_rx.vga1 = 10;
    config_tx.vga2 = config_rx.vga2 = 0;


    configure_module(devtx, &config_tx);


    init_sync_tx(devtx);

    calibrate(devtx);

    flexframegenprops_init_default(&ffp);

    ffp.fec0 = LIQUID_FEC_NONE;
    ffp.fec1 = LIQUID_FEC_NONE;
    ffp.mod_scheme = LIQUID_MODEM_QAM4;

    flexframegen fg = flexframegen_create(&ffp);

    FILE * f1 = fopen(argv[2], "w");
    setvbuf ( f1 , NULL , _IONBF , 0 );


    for (i = 0; i < 8; i++)
        header[i] = i;

    while (status == 0 && cnt < 1000) {
        cnt++;

        memset(payload, 0x00, PAYLOAD_LENGTH);
        sprintf((char *) payload, "%d", cnt);
        memset(&payload[13], 0x00, PAYLOAD_LENGTH - 13);


        flexframegen_assemble(fg, header, payload, PAYLOAD_LENGTH);
        symbol_len = flexframegen_getframelen(fg);

        frame_complete = 0;
        lastpos = 0;
        while (!frame_complete) {
            frame_complete = flexframegen_write_samples(fg, buf, buf_len);
            memcpy(&y[lastpos], buf, buf_len * sizeof(float
            complex));
            lastpos = lastpos + buf_len;
        }

        samples_len = symbol_len;
        tx_samples = convert_comlexfloat_to_sc16q11(y, symbol_len);

        status = sync_tx(devtx, tx_samples, samples_len);
        if (status) break;

        gettimeofday(&t, NULL);

        fprintf(f1, "%lu,%lu,%d\n",t.tv_sec, t.tv_usec, cnt);
        usleep(10000);
    }
    fclose(f1);


    bladerf_close(devtx);
    flexframegen_destroy(fg);
    return status;
}
