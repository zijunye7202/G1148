h, m, s = map(int, input().split())

l: list[str] = []

s += 1

if s >= 60:
    m += 1
    s = 0

if m >= 60:
    h += 1
    m = 0

if h >= 24:
    h = 0
    m = 0
    s = 0

print(f"{h:02d}:{m:02d}:{s:02d}")
