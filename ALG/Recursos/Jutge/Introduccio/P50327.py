n: str = input()

for i in range(len(n)-1, -1, -1):

    print(n[i], end="") if i != 0 else print(n[i])
