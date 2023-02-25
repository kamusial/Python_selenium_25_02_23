#Page Object Model

class LoginPage:
    def __init__(self, driver):
        self.driver = driver
        self.username_field_id = 'user-name'
        self.password_field_id = 'password'
        self.login_button_name = 'login-button'

    def open(self):
        self.driver.get('http://www.saucedemo.com')

    def enter_username(self, username):
        field = self.driver.find_element('id', self.username_field_id)
        field.clear()
        field.send_keys(username)

    def enter_password(self, password):
        field = self.driver.find_element('id', self.password_field_id)
        field.clear()
        field.send_keys(password)

    def click_login(self):
        button = self.driver.find_element('name', self.login_button_name)
        button.click()






