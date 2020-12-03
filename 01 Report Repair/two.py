expenses = {}

for line in open('expenses', 'r'):
    expenses[int(line)] = True

for a in expenses:
    for b in expenses:
        want = 2020 - a - b
        if want in expenses:
            print(f"{a} * {b} * {want} = {a * b * want}")
            exit(0)

print("this should never happen")