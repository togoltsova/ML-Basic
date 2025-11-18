"""
Создайте класс `Plane`, наследник `Vehicle`
"""
from homework_05.base import Vehicle
from homework_05.exceptions import CargoOverload


class Plane(Vehicle):

    def __init__(self, cargo, max_cargo):
        super().__init__()
        self.cargo = cargo
        self.max_cargo = max_cargo

    def load_cargo(self, cargo: int):
        """
        принимает число, проверяет, что в сумме с текущим `cargo` не будет перегруза, и обновляет значение,
        в ином случае выкидывает исключение `exceptions.CargoOverload`
        """
        if self.cargo + cargo <= self.max_cargo:
            raise CargoOverload("Volume of cargo is overloaded")
        self.cargo += cargo
        return

    def remove_all_cargo(self) -> int:
        """
        обнуляет значение `cargo` и возвращает значение `cargo`, которое было до обнуления
        """
        cargo_before_remove = self.cargo
        self.cargo = 0
        return cargo_before_remove

