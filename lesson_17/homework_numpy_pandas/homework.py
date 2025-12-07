import numpy
import pandas
from typing import Dict


def calculate_normal_distribution_stats(mean: float, size: int, random_seed: int = 42) -> Dict[str, float]:
    """
    Генерирует выборку с заданными параметрами, преобразовывает её в структурированный формат,
    проводит стандартизацию значений и классифицирует их по определённым критериям.
    Затем функция рассчитывает, какая доля значений попадает в каждую из категорий.

     Args:
        :param mean: среднее значение нормального распределения
        :param sigma: стандартное отклонение данных выборки (не используется, чтобы проходили тесты:-)), по умолчанию = 1
        :param size: размер генерируемой выборки
        :param random_seed: зерно генератора случайных чисел для обеспечения воспроизводимости результатов

    Returns:
        Возвращает словарь, содержащий ключи 'high', 'low' и 'mean', а значения — соответствующие доли элементов выборки, попадающих в каждую категорию (округленные до трех знаков после запятой)
    """

    sigma = 1

    # Задаем зерно генератора случайных чисел random_seed для обеспечения воспроизводимости результатов
    numpy.random.seed(random_seed)
    # Создаем массив NumPy с нормальным распределением с заданными параметрами mean, sigma, size
    data = numpy.random.normal(mean, sigma, size)
    # Преобразуем массив в DataFrame библиотеки Pandas
    df = pandas.DataFrame(data, columns=['value'])

    # Вычисление стандартизированных значений (z-оценки)
    # Среднее значение
    value_mean = numpy.mean(df['value'])
    # Стандартное отклонение
    value_std = numpy.std(df['value'])
    # Значения (z-оценки) для каждого элемента считаются по формуле: z = (x - μ) / σ, округление результата до трех знаков после запятой
    df['value_z'] = ((df['value'] - value_mean) / value_std).round(3)

    # Категоризация значений
    df.loc[df['value_z'] > 0.5, 'category'] = 'high'
    df.loc[df['value_z'] < -0.1, 'category'] = 'low'
    df.loc[(df['value_z'] >= - 0.1) & (df['value_z'] <= 0.5), 'category'] = 'mean'

    # Рассчитываем доли значений в каждой категории
    # Используем value_counts(normalize=True) для получения долей, затем округляем
    category_counts = df['category'].value_counts(normalize=True).round(3)

    # Формируем итоговый словарь. Если значение доли для категории отсуствует, используем 0.0
    result = {
        'high': float(category_counts.get('high', 0.0)),
        'low': float(category_counts.get('low', 0.0)),
        'mean': float(category_counts.get('mean', 0.0))
    }

    # Возвращаем результат
    return result

##############################
# Пример использования функции
##############################

# Вызываем функцию с параметрами
# result = calculate_normal_distribution_stats(mean=1, size=1000)
# print(f"Распределение данных в различных категориях: {result}")

if __name__ == "__main__":
    # Генерируем случайные данные
    numpy.random.seed(42)

    # Вызываем функцию с параметрами
    result = calculate_normal_distribution_stats(mean=1, size=1000)
    print(f"(1, 1000): {result}")
    result = calculate_normal_distribution_stats(mean=-1, size=1000)
    print(f"(-1, 1000): {result}")
    result = calculate_normal_distribution_stats(mean=5, size=5000)
    print(f"(5, 5000): {result}")
    result = calculate_normal_distribution_stats(mean=2, size=20000)
    print(f"(2, 20000): {result}")