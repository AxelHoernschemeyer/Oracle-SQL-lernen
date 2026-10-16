if File('test.txt').exists(): then
    meldung = File('test.txt').read_text()
    print(meldung)