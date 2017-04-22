lst = [ '25', '50', '100', '200' ]


for i in lst:
    incoming = 0
    outgoing = 0
    valid = 0
    total= 1000
    for line in open(i+'.tran.csv', encoding = "ISO-8859-1").read().split('\n'):
        line = line.strip().split()
        gelenler += 1
        try:
            int( line.split()[1] )
            duzgunler += 1
        except:
            pass
    print(duzgunler, gelenler, total)
    print(float(duzgunler)/float(gelenler),float(gelenler)/float(total),float(duzgunler)/float(total) )