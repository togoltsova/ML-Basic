import pytest
from lesson_12.src.main import add, sub, mul, div, get_num


@pytest.mark.parametrize("num_1, num_2, expected", [
    (1, 2, 3),
    (5, 3, 8),
    (-1, -2, -3),
])
def test_add(num_1, num_2, expected):
    assert add(num_1, num_2) == expected


def test_sub(num_1, num_2, num__1):
    assert sub(num_1, num_2) == num__1
    assert sub(-2, 1) == -3


def test_mul():
    assert mul(1, 2) == 2
    assert mul(-2, 1) == -2


def test_div(nums):
    assert div(1, nums[2]) == 0.5
    assert div(-2, 1) == -2


def test_get_num(mocker):
    mocker.patch("random.randint", return_value=1)
    assert get_num() == 1
