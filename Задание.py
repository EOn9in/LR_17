with open('input.txt.txt', 'r') as f:
    numbers = f.read().splitlines()

# Используем стек для хранения чисел в обратном порядке
stack = []
for number in numbers:
    stack.append(number)

with open('output.txt.txt', 'w') as f:
    while stack:
        f.write(stack.pop() + '\n')