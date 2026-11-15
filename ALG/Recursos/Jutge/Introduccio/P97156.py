a, b = map(int, input().split())

if a <= b:
    for i in range(a, b+1):
        if i == b:
            print(i)
        else:
            print(i, end=",")
else:
    print("")