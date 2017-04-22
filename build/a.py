lst = [ '1.out', '2.out', '3.out' ]




for i in lst:
    gelenler = 0
    duzgunler = 0
    total= 1000
    for line in open(i, encoding = "ISO-8859-1").read().split('\n'):
        gelenler += 1
        try:
            int( line.split()[1] )
            duzgunler += 1
        except:
            pass
    print(duzgunler, gelenler, total)
    print(float(duzgunler)/float(gelenler),float(gelenler)/float(total),float(duzgunler)/float(total) )