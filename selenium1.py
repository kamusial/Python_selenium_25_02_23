from selenium import webdriver
import time

time.sleep(1)
driver = webdriver.Chrome()
driver.get('https://google.com')
print('Nazwa strony',driver.title)
time.sleep(2)
driver.quit()