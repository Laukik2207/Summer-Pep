n = int(input())
for i in range(n):
    for j in range(n-i):
        print(chr(65 + j), end=' ')

    for j in range(2 * i - 1):
       print(" ", end=' ')
    
    start = n-2 if i == 0 else n-i-1
    for j in range(start, -1, -1):
        print(chr(65 + j), end=' ')
    print()