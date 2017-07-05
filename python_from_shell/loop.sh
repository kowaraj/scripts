echo -e 'f1 = open("./0x0346.h","r")\nf2=open("./0x0356.h","w") \nfor e in f1.readlines(): \n f2.write(e.rstrip()+"0x0356\\n")' | python
