from lesson_17.homework_numpy_pandas.homework import calculate_normal_distribution_stats
import pytest

@pytest.mark.parametrize("mean, size, expected_categories", [
        (1, 1000, {'high': 0.3, 'low': 0.5, 'mean': 0.2}),
        (-1, 1000, {'high': 0.3, 'low': 0.5, 'mean': 0.2}),
        (5, 5000, {'high': 0.3, 'low': 0.5, 'mean': 0.2}),
        (2, 20000, {'high': 0.3, 'low': 0.5, 'mean': 0.2})
    ])
def test_normal_distribution_proportions(mean, size, expected_categories):
    EPSILON = 0.07
    result = calculate_normal_distribution_stats(mean, size, random_seed=42)

    print(f"Тест с параметрами mean={mean}, size={size}")
    #print(f"Ожидаемые категории: {expected_categories}")
    #print(f"Полученные категории: {result}")

    all_categories_match = set(result.keys()) == set(expected_categories.keys())
    print("Категории совпадают:", all_categories_match)

    for category, expected_prop in expected_categories.items():
        actual = result.get(category, 0)
        difference = abs(actual - expected_prop)
        print(f"Категория '{category}', {'OK' if difference < EPSILON else 'FAIL'}")

    total = sum(result.values())
    print(f"Сумма пропорций: {total} (должна быть примерно 1.0)")


def test_different_seeds():
    EPSILON = 0.07
    result1 = calculate_normal_distribution_stats(0, 1000, random_seed=42)
    result2 = calculate_normal_distribution_stats(0, 1000, random_seed=123)

    #print("Сравнение результатов с разными seed:")
    #print("Seed 42:", result1)
    #print("Seed 123:", result2)

    for category in result1:
        diff = abs(result1[category] - result2.get(category, 0))
        print(f"Категория '{category}', {'OK' if diff < EPSILON * 2 else 'FAIL'}")


def test_edge_cases():
    test_cases = [
        (0, 10),
        (1000, 100),
        (-1000, 100)
    ]
    for mean, size in test_cases:
        result = calculate_normal_distribution_stats(mean, size)
        print(f"Edge case (mean={mean}, size={size}) — Результат: {result}")
        total = sum(result.values())
        print(f"Сумма пропорций: {total} (должна быть примерно 1.0)")


# Запуск всех тестов
# if __name__ == "__main__":
#     test_cases = [
#         (1, 1000, {'high': 0.3, 'low': 0.5, 'mean': 0.2}),
#         (-1, 1000, {'high': 0.3, 'low': 0.5, 'mean': 0.2}),
#         (5, 5000, {'high': 0.3, 'low': 0.5, 'mean': 0.2}),
#         (2, 20000, {'high': 0.3, 'low': 0.5, 'mean': 0.2})
#     ]
#
#     for mean, size, expected in test_cases:
#         test_normal_distribution_proportions(mean, size, expected)
#
#     test_different_seeds()
#     test_edge_cases()






print()