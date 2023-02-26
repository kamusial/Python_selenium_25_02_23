from pytest_kod import *

def test_multiply():
    assert multiply(5, 6) == 30
    assert multiply(100, 1.1) == 110
    assert multiply('mama', 5) == 0
