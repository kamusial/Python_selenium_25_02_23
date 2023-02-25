from selenium import webdriver
#from selenium.webdriver.common.keys import Keys
import time

driver = webdriver.Chrome()
driver.get('https://www.saucedemo.com/')
print('Nazwa strony',driver.title)
time.sleep(1)

username_field = driver.find_element('id', 'user-name')
username_field.clear()
username_field.send_keys('standard_user')

password_field = driver.find_element('id', 'password')
username_field.clear()
password_field.send_keys('secret_sauce')

login_button = driver.find_element('name', 'login-button')
login_button.click()

time.sleep(1)
driver.get_screenshot_as_file('screenshot.png')
driver.quit()