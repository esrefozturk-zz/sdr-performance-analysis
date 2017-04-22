#include "config.h"
#include "utils.h"
#include <sys/time.h>

struct timeval t;
FILE * f1;

/* The RX and TX modules are configured independently for these parameters */
void print_bytes(const void *object, size_t size) {
    const unsigned char *const bytes = object;
    size_t i;

    printf("[ ");
    for (i = 0; i < size; i++) {
        printf("%02x ", bytes[i]);
    }
    printf("]");
}


// user-defined static callback function
static int mycallback(unsigned char *_header,
                      int _header_valid,
                      unsigned char *_payload,
                      unsigned int _payload_len,
                      int _payload_valid,
                      framesyncstats_s _stats,
                      void *_userdata) {
//    printf("***** callback invoked!\n");
//    printf("  header (%s)\n",  _header_valid  ? "valid" : "INVALID");
//    printf("  payload (%s)\n", _payload_valid ? "valid" : "INVALID");
//    printf("  payload length (%d)\n", _payload_len);
//
//    // type-cast, de-reference, and increment frame counter
    unsigned int *counter = (unsigned int *) _userdata;
    (*counter)++;
   //framesyncstats_print(&_stats);

    if (_header_valid) {
//		printf("Packet %u contains (%s) with RSSI %5.5f\n", *counter, _payload, _stats.rssi);

        unsigned int n = 6;
        unsigned char payload[PAYLOAD_LENGTH] = {0};
        snprintf((char *) payload, 7, "Packet");
        unsigned int num_bit_errors = count_bit_errors_array(payload, _payload, n);
        //printf("[%u]: (%s):  %3u / %3u\tRSSI=(%5.5f)\n", *counter, _payload, num_bit_errors, n * 8, _stats.rssi)

        gettimeofday(&t, NULL);
        fprintf(f1, "%s %lu %lu\n", _payload,t.tv_sec, t.tv_usec);
    }
    //flexframesync_print(fs);
    return 0;
}


int process_samples(int16_t *samples, unsigned int sample_length) {
    int status = 0;
    float complex
    *y = convert_sc16q11_to_comlexfloat(samples, sample_length);
    if (y != NULL) {
        for (int i = 0; i <= sample_length; i = i + 32)
            flexframesync_execute(fs, &y[i], 32);
        free(y);
    } else {
        status = BLADERF_ERR_MEM;
    }
    return status;
}

/* Usage:
 *   libbladeRF_example_boilerplate [serial #]
 *
 * If a serial number is supplied, the program will attempt to open the
 * device with the provided serial number.
 *
 * Otherwise, the first available device will be used.
 */

int main(int argc, char *argv[]) {
    int status;
    struct module_config config_rx;
    struct module_config config_tx;
    struct bladerf *devrx = NULL;
    struct bladerf_devinfo dev_info;
    unsigned int frame_counter = 0;

    bladerf_init_devinfo(&dev_info);

    f1 = fopen(argv[2], "w");
    setvbuf ( f1 , NULL , _IONBF , 0 );

    if (argc >= 2) {
        strncpy(dev_info.serial, argv[1], sizeof(dev_info.serial) - 1);
    }
    status = bladerf_open_with_devinfo(&devrx, &dev_info);
    if (status != 0) {
        fprintf(stderr, "Unable to open device: %s\n", bladerf_strerror(status));
        return 1;
    }
    //fprintf(stdout, "bladerf_open_with_devinfo: %s\n", bladerf_strerror(status));


    //    hostedx115-latest.rbf
    status = bladerf_load_fpga(devrx, "./hostedx115-latest.rbf");
    if (status != 0) {
        fprintf(stderr, "Unable to bladerf_load_fpga  device: %s\n", bladerf_strerror(status));
        return status;
    }
    //fprintf(stdout, "bladerf_load_fpga: %s\n", bladerf_strerror(status));

    /* Set up RX module parameters */
    config_rx.module = BLADERF_MODULE_RX;
    config_tx.module = BLADERF_MODULE_TX;
    config_tx.frequency = config_rx.frequency = FREQUENCY_USED;
    config_tx.bandwidth = config_rx.bandwidth = BANDWIDTH_USED;
    config_tx.samplerate = config_rx.samplerate = SAMPLING_RATE_USED;
    config_tx.rx_lna = config_rx.rx_lna = BLADERF_LNA_GAIN_MID;
    config_tx.vga1 = config_rx.vga1 = 30;
    config_tx.vga2 = config_rx.vga2 = 3;
    status = configure_module(devrx, &config_tx);
    if (status != 0) {
        fprintf(stderr, "Failed to configure RX module. Exiting.\n");
        goto out;
    }
    //fprintf(stdout, "configure_module: %s\n", bladerf_strerror(status));
    status = configure_module(devrx, &config_rx);
    if (status != 0) {
        fprintf(stderr, "Failed to configure RX module. Exiting.\n");
        goto out;
    }
    //fprintf(stdout, "configure_module: %s\n", bladerf_strerror(status));

    /* Initialize synch interface on RX and TX modules */
    status = init_sync_tx(devrx);
    if (status != 0) {
        goto out;
    }

    /* Initialize synch interface on RX and TX modules */
    status = init_sync_rx(devrx);
    if (status != 0) {
        goto out;
    }


    status = calibrate(devrx);
    if (status != 0) {
        fprintf(stderr, "Failed to calibrate RX module. Exiting.\n");
        goto out;
    }
    //fprintf(stdout, "calibrate: %s\n", bladerf_strerror(status));


    fs = flexframesync_create(mycallback, (void *) &frame_counter);
    if (fs == NULL) {
        fprintf(stderr, "Failed to framesync64_create. Exiting.\n");
        goto out;
    }


    status = sync_rx(devrx, &process_samples);
    if (status != 0)      {
        fprintf(stderr, "Failed to sync_rx(). Exiting. %s\n", bladerf_strerror(status));
        goto out;
    }

    out:
    bladerf_close(devrx);
    //fprintf(stderr, "RX STATUS: %u,  %s\n", status, bladerf_strerror(status));
    return status;
}
