import random

print(random.random())
print(random.randint(1, 100))

my_list = [1, 2, 3, 4, 5]

print(random.choice(my_list))

print(my_list)
random.shuffle(my_list) # mix array
print(my_list)

rand_number = list(range(1, 50))
print(rand_number)
print(random.sample(rand_number, 5)) # 5 random unique numbers