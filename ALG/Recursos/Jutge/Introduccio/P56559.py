a1, a2, b1, b2 = map(int, input().split())


if (a1 == b1 and a2 == b2):
    print("=")
    
elif (a1 >= b1 and a2 <= b2):
    print("1")

elif (b1 >= a1 and b2 <= a2):
    print("2")

else: 
    print("?") 