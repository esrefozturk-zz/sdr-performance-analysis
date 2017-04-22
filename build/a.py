lst = [ '25', '50', '100' ]

f = open('results.csv', 'w')
f.write('distance(cm),total,received,valid,duration\n')

for i in lst:
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
            total_duration += (d[j]['recv']-d[j]['tran'])
    duration = total_duration/len(d)

    f.write('{},{},{},{},{}\n'.format(i,total,incoming,valid,duration/1000000))
