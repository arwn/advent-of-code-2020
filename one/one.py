expenses = {}

for line in open('expenses', 'r'):
    expenses[int(line)] = True

for e in expenses:
    want = 2020-e
    have = e
    if want in expenses != None:
        print(f"{want} * {have} = {want * have}")
        exit(0)
else:
    print("this should not happen")