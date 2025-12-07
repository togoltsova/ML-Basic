import pytest
import os


@pytest.fixture
def num_10():
    return 10


@pytest.fixture
def num_3():
    return 3


@pytest.fixture
def num_7():
    return 7


@pytest.fixture(scope="function")
def nums():
    print()
    print()
    print()
    yield [1, 2, 3, 5, 7, 10]
    # os.remove("test.txt")

