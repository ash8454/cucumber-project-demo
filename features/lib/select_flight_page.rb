require 'selenium-webdriver'
require_relative 'Element'

class SelectFlightsPage
  include Element

  RESERVE_FLIGHTS_BTN = "reserveFlights"
  def initialize(driver)
    @driver = driver
  end

  def verify
    wait_until_element_present(:name, RESERVE_FLIGHTS_BTN, 10)
    verify_element(:name, RESERVE_FLIGHTS_BTN, 10)
  end
end