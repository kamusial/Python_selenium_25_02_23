from selenium import webdriver
#from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import time
import datetime
from selenium.common.exceptions import NoSuchElementException


def make_screenshot(driver):
    teraz = datetime.datetime.now()
    screenshot = 'screenshot' + teraz.strftime('_%H%M%S') + '.png'
    driver.get_screenshot_as_file(screenshot)

if __name__ == '__main__':
    driver = webdriver.Chrome()
    driver.get('https://www.saucedemo.com/')
    print('Nazwa strony',driver.title)
    time.sleep(1)

    try:
        username_field = driver.find_element(By.ID, 'user-name')
    except NoSuchElementException:
        make_screenshot(driver)
        raise

    username_field.clear()
    username_field.send_keys('standard_user')
    password_field = driver.find_element('xpath', '//*[@id="password"]')
    username_field.clear()
    password_field.send_keys('secret_sauce')

    login_button = driver.find_element('name', 'login-button')
    if not login_button.get_attribute('disabled'):
            login_button.click()

    time.sleep(1)
    driver.get_screenshot_as_file('screenshot.png')
    driver.quit()