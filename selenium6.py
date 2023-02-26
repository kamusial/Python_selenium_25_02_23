from selenium import webdriver
from selenium4 import LoginPage
import time
from selenium2 import make_screenshot
import pytest

test_data = [
    ('standard_user', 'secret_sauce', 'https://www.saucedemo.com/inventory.html'),
    ('locked_out_user', 'secret_sauce', 'https://www.saucedemo.com/'),
    ('problem_user', 'secret_sauce', 'https://www.saucedemo.com/inventory.html'),
    (www.saucedemo.com/inventory.html')
]

@pytest.mark.parametrize()
def test_login_page(username, password, url):
    driver = webdriver.Chrome()
    page = LoginPage(driver)
    page.open()
    page.enter_username(username)
    page.enter_password(password)
    page.click_login()
    time.sleep(1)
    try:
        assert driver.current_url == url, make_screenshot(driver)
    finally:
        print('po asercji')
        driver.quit()