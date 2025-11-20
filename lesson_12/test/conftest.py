import os
import pytest


@pytest.fixture
def num_1():
    return 1

@pytest.fixture
def num_2():
    return 2

@pytest.fixture
def num_3():
    return 3

@pytest.fixture(scope="session")
def num__1():
    return -1

@pytest.fixture(scope="function")
def nums():
    # return [0,1,2,3,4,5,6,7,8,9,10]
    yield [0,1,2,3,4,5,6,7,8,9,10]
    os.remove("test.txt")
