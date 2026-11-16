n: int = int(input())

while n > 1:

    print(n % 2, end="")
    n //= 2

if n == 1:

    print(1)

if n == 0: 

    print(0)
    