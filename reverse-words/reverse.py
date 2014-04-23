import sys

args = sys.argv
filename = args[1]

input = open(filename,'r')

T = map(int,input.readline().split())[0]

for i in range(1,T+1):
    result = input.readline().split()
    result.reverse()
    result = ' '.join(result)
    print "Case #%i: %s"%(i,result)

input.close()
