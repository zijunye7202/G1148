a1, a2, b1, b2 = map(int, input().split())

if (a1 == b1 and a2 == b2):
    a = "="

elif (a1 >= b1 and a2 <= b2):
    a = "1"

elif (a1 <= b1 and a2 >= b2):
    a = "2"

else:
    a = "?"
    
if (a1 <= b2 and a2 >= b1):

    print(f"{a} , [{max(a1,b1)},{min(a2,b2)}]")

else:

    print(f"{a} , []")