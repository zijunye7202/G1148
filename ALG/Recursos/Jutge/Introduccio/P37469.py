n: int = int(input())

h: int = n // 3600
m: int = (n - 3600*h) // 60
s: int = (n - 3600*h - 60*m)

print(h, m, s)