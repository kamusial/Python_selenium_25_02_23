from selenium import webdriver
from selenium4 import LoginPage
import time
from selenium2 import make_screenshot
import pytest

def test_login_page():
    driver = webdriver.Chrome()
    page = LoginPage(driver)
    page.open()
    page.enter_username('standard_user')
    page.enter_password('secret_sauce')
    page.click_login()
    time.sleep(1)
    try:
        assert driver.current_url == 'https://www.saucedemo.com/inventory.html', make_screenshot(driver)
    except AssertionError:
        print('Assercja nie przeszła')
        raise
    else:
        print('assercja przeszła')
    finally:
        print('po asercji')
        driver.quit()
#