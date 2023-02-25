from selenium import webdriver
from selenium4 import LoginPage
import time

def test_login_page():
    driver = webdriver.Chrome()
    page = LoginPage(driver)
    page.open()
    page.enter_username('standard_user')
    page.enter_password('secret_sauce')
    page.click_login()
    time.sleep(1)
    assert driver.current_url == 'https://www.saucedemo.com/inventory.html'
    driver.quit()