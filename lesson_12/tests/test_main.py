import pytest
from src.main import add, sub, mul, div, get_num


@pytest.mark.parametrize("a, b, result", [
    (1, 2, 3),
    (10, 2, 12),
    (7, 4, 11),
    (-1, -8, -9),
    (0, 2, 2),
])
def test_add(a, b, result):
    assert add(a, b) == result, 'НЕ ВЕРНО СКЛАДЫВАЕТ'

    # assert add(1, 2) == 3
    # assert add(10, 2) == 12
    # assert add(7, 4) == 11
    # assert add(-1, -8) == -9
    # assert add(0, 2) == 2


def test_sub(num_3, num_7, num_10):
    x = num_3
    y = num_10

    result = y - x

    assert result == 7

    print()
    assert sub(num_10, num_3) == num_7
    assert sub(-10, -5) == -5
    assert sub(0, num_3) == -3


def test_mul(nums):
    assert mul(nums[5], nums[1]) == 20
    nums[5] = 100
    nums[1] = 10
    assert mul(nums[5], nums[1]) == 1000


def test_div(nums):
    assert div(nums[5], nums[3]) == 2


# def test_div_by_zero():
#     with pytest.raises(ValueError, match="Делить на ноль нельзя"):
#         div(10,0)


def test_get_num(mocker):
    mocker.patch('random.randint', return_value=7)

    result = get_num(1, 1000)

    assert result == 1007