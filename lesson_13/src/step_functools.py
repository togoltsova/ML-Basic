import itertools
import functools


def fibonacci(n):
    return list(itertools.islice(itertools.count(0), n))

counter = itertools.count(start=10, step=5)

for _ in range(100):
    print(next(counter))

color = itertools.cycle(["red", "green", "blue"])

for _ in range(100):
    print(next(color))


def fibonacci_with_cache(n):
    cache = {}
    if n in cache:
        return cache[n]
    result = fibonacci(n)
    cache[n] = result
    return result

@functools.lru_cache(maxsize=5)
def factual(n):
    print(n)
    return 1 if n < 2 else n * factual(n - 1)