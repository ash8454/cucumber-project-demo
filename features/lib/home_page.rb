require 'selenium-webdriver'
require_relative 'Element'

  class Homepage
    include Element

    #Declaring variables for locator either name, id or xpath
    USERNAME_TEXTBOX = 'userName'
    PASSWORD_TEXTBOX = 'password'
    LOGIN_BTN = 'login'

    def initialize(driver)
      @driver = driver
    end

    def login(username, password)
      wait_until_element_present(:name, USERNAME_TEXTBOX, 5)
      send_keys(:name, USERNAME_TEXTBOX, username)
      send_keys(:name, PASSWORD_TEXTBOX, password)
      click(:name, LOGIN_BTN)
    end

    def login_with_record(record)
      data_record = YAML.load(File.read("C:/Users/trainer/RubymineProjects/Cucumber_Project/features/data/data.yml"))
      wait_until_element_present(:name, 'userName', 5)
      send_keys(:name, USERNAME_TEXTBOX, data_record["#{record}"]['username'])
      send_keys(:name, PASSWORD_TEXTBOX, data_record["#{record}"]['password'])
      click(:name, LOGIN_BTN)
    end

  end