lst = [ '25', '50', '100' ]

f = open('results-summary.csv', 'w')
f.write('distance(cm),total,received,valid,duration\n')

for i in lst:
    g = open('results-' + i + '.csv', 'w')
    g.write('packet,duration\n')

    d = {}
    incoming = 0
    valid = 0
    total= 1000
    for line in open(i+'.tran.csv', encoding = "ISO-8859-1").read().strip().split('\n'):
        line = line.strip().split(',')
        d[line[2]] = {
            'tran': int(line[0])* 10**6 + int(line[1])
        }
    for line in open(i+'.recv.csv', encoding = "ISO-8859-1").read().strip().split('\n'):
        line = line.strip().split(',')
        incoming += 1
        try:
            if 0 < int(line[2]) <= 1000:
                valid += 1
                d[line[2]]['recv'] = int(line[0])* 10**6 + int(line[1])
        except:
            pass
    total_duration = 0
    for j in d:
        if d[j].get('recv'):
            dur = (d[j]['recv']-d[j]['tran'])
            total_duration += dur
            g.write('{},{}\n'.format(j,dur/1000000))
    duration = total_duration/incoming
    g.close()

    f.write('{},{},{},{},{}\n'.format(i,total,incoming,valid,duration/1000000))
f.close()
