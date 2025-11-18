"""
Доработайте класс `Vehicle`
"""
from abc import ABC

from homework_05.exceptions import LowFuelError, NotEnoughFuel


class Vehicle(ABC):

    def __init__(self, weight=15000, started=False, fuel=47, fuel_consumption=8):
        self._weight = weight
        self._started = started
        self._fuel = fuel
        self._fuel_consumption = fuel_consumption

    @property
    def weight(self) -> int:
        return self._weight

    @weight.setter
    def weight(self, value):
        if value < 0:
            raise ValueError("Weight cannot be negative")
        self._weight = value

    @property
    def started(self) -> bool:
        return self._started

    @started.setter
    def started(self, value):
        if value not in [True, False]:
            raise ValueError("Started can be True or False")
        self._started = value

    """
    fuel = текущий обьем топлива в баке. Liters
    """
    @property
    def fuel(self) -> int:
        return self._fuel

    @fuel.setter
    def fuel(self, value):
        if value < 0:
            raise ValueError("Fuel capacity cannot be negative")
        # if value < 0 or value > max_tank_volume:
        #   raise ValueError("Fuel capacity is out of range of the tank volume")
        self._fuel = value

    """
    fuel_consumption = потребление топлива на 100 км. Liters per 100 kilometers (L/100km)
    """
    @property
    def fuel_consumption(self):
        return self._fuel_consumption

    @fuel_consumption.setter
    def fuel_consumption(self, value):
        if value < 0:
            raise ValueError("Fuel consumption cannot be negative")
        # if value < 0 or value > max_tank_volume:
        #   raise ValueError("Fuel consumption is out of range of the tank volume")
        self._fuel_consumption = value

    def start(self):
        """
        проверить состояние `started`. И если не `started`, то нужно проверить, что топлива больше нуля,
        и обновить состояние `started`, иначе нужно выкинуть исключение `exceptions.LowFuelError`
        """
        if self.started:
            return print("Vehicle is already started")
        if self.fuel <= 0:
            raise LowFuelError("Not enough fuel")
        self.started = True
        return print("Vehicle started")

    def move(self, distance):
        """
        проверяет, что топлива достаточно для преодоления переданной дистанции (вплоть до полного расхода),
        и изменяет количество оставшегося топлива, иначе выкидывает исключение `exceptions.NotEnoughFuel`
        """
        if not self.started:
            return print("Vehicle is not started")
        fuel_consumption_total = distance * self.fuel_consumption / 100
        if self.fuel < fuel_consumption_total:
            raise NotEnoughFuel(f"Not enough fuel {self.fuel} L "
                                f"with fuel consumption {self.fuel_consumption} L/100km "
                                f"to move vehicle {distance} km")
        self.fuel -= fuel_consumption_total
        return print(f"Vehicle moved {distance} kilometers")
