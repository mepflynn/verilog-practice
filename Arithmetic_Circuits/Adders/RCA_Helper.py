# Quick helper for tediously writing and connecting
# FAs for a ripple-carry adder

f = open("FA_Instantiations.txt","w");

for i in range(1,8):

    c = str(i)
    cnext = str(i + 1)

    s = "FA f" + c + "(a[" + c + "] ,b[" + c + "], carry[" + c + "], s[" + c + "], carry[" + cnext + "]);\n"

    f.write(s)