a1, a2, b1, b2 = map(int, input().split())

if (a1 <= b2 and a2 >= b1):

    print(f"[{max(a1, b1)},{min(a2, b2)}]")

else:
    print("[]")