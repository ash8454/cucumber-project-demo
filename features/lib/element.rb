require 'selenium-webdriver'

module Element

  def find_element(locator_type, locator)
    begin
      element = @driver.find_element(:"#{locator_type}", locator)
      return true if element.displayed?
    rescue
      @driver.save_screenshot("screenshots/screenshot1.png")
      fail "Unable to find the element by locator type #{locator_type} and locator #{locator}"
    end
  end

  def verify_element(locator_type, locator, timeout)
    t = timeout.to_i
    begin
      element = @driver.find_element(:"#{locator_type}", locator)
      wait = Selenium::WebDriver::Wait.new(:timeout => t)
      wait.until { element.displayed? }
    rescue
      @driver.save_screenshot("screenshots/screenshot1.png")
      fail "Unable to verify the element by locator type #{locator_type} and locator #{locator}"
    end
  end

  def select_drop_down_value(locator_type, locator, value)
    begin
    dropdown = @driver.find_element(:"#{locator_type}", locator)
    options = dropdown.find_elements(:tag_name, 'option')
    options.each { |option| option.click if option.text == "#{value}"}
    rescue Exception => e
      @driver.save_screenshot("screenshots/screenshot1.png")
      raise "Failed to find the element #{e.message}"
    end
  end

  def wait_until_element_present(locator_type, locator, timeout=10)
    t = timeout.to_i
    begin
      element = @driver.find_element(:"#{locator_type}", locator)
      wait = Selenium::WebDriver::Wait.new(:timeout => t)
      wait.until { element.displayed? }
    rescue
      #@driver.save_screenshot("C:/Users/trainer/RubymineProjects/Cucumber_Project_Refactored/features/screenshots/screenshot1.png")
      fail "Unable to verify the element by locator type #{locator_type} and locator #{locator}"
    end
  end

  def click(locator_type, locator)
    begin
      element = @driver.find_element(:"#{locator_type}", locator)
      element.click
    rescue
      #@driver.save_screenshot("screenshots/screenshot1.png")
      fail "Unable to click the element by locator type #{locator_type} and locator #{locator}"
    end
  end

  def send_keys(locator_type, locator, text)
    begin
      element = @driver.find_element(:"#{locator_type}", locator)
      element.send_keys(text)
    rescue
      @driver.save_screenshot("screenshots/screenshot1.png")
      fail "Unable to find the element by locator type #{locator_type} and locator #{locator}"
    end
  end

  def assert_text(text, locator_type, locator)
    begin
      element = @driver.find_element(:"#{locator_type}", locator)
      fail "Text doesn't match" unless element.text == text
      # if element.text == text
      #   puts "something"
      # else
      #   fail ("Text doesn't match")
      # end
    rescue
      @driver.save_screenshot("screenshots/screenshot1.png")
      fail "Text doesn't match"
    end
  end

  # def select_radio_button(locator_type, locator, value)
  #   begin
  #     element = @driver.find_element(:"#{locator_type}", locator)
  #     element.click
  #   rescue
  #     @driver.save_screenshot("screenshots/screenshot1.png")
  #     fail "Unable to click the element by locator type #{locator_type} and locator #{locator}"
  #   end
  # end


end