require 'selenium-WebDriver'
require_relative 'Element'

class FlightFinderPage
  include Element

  FIND_FLIGHTS_BTN = 'findFlights'
  ROUND_TRIP_RADIO_BTN = "//input[@value='roundtrip']"
  ONE_WAY_RADIO_BTN = "//input[@value='oneway']"
  PASSENGERS_DROPDOWN = "passCount"
  DEPARTING_CITY_DROPDOWN = "fromPort"
  DEPARTING_MONTH_DROPDOWN = "fromMonth"
  DEPARTING_DAY_DROPDOWN = "fromDay"
  ARRIVAL_CITY_DROPDOWN = "toPort"
  RETURN_MONTH_DROPDOWN = "toMonth"
  RETURN_DAY_DROPDOWN = "toDay"


  def initialize(driver)
    @driver = driver
  end

  def verify
    wait_until_element_present(:name, FIND_FLIGHTS_BTN, 10)
    verify_element(:name, FIND_FLIGHTS_BTN, 10)
  end

  def complete_flight_finder_page(record)
    data_record = YAML.load(File.read("C:/Users/trainer/RubymineProjects/Cucumber_Project/features/data/data.yml"))
    select_trip_type(data_record["#{record}"]['trip_type'])
    select_no_of_passengers(data_record["#{record}"]['no_of_passengers'])
    select_departing_city(data_record["#{record}"]['depart_city'])
    select_departing_month(data_record["#{record}"]['depart_month'])
    select_departing_day(data_record["#{record}"]['depart_day'])
    select_arrival_city(data_record["#{record}"]['arrival_city'])
    select_return_month(data_record["#{record}"]['return_month'])
    select_return_day(data_record["#{record}"]['return_day'])
    select_service_class(data_record["#{record}"]['service_class'])
    click_continue_btn
  end

  def select_trip_type(trip_type)
    if trip_type.delete(" ").downcase == "roundtrip"
      click(:xpath, ROUND_TRIP_RADIO_BTN)
    else
      click(:xpath, ONE_WAY_RADIO_BTN)
    end
  end

  def select_no_of_passengers(num)
    select_drop_down_value(:name, PASSENGERS_DROPDOWN, num)
  end

  def select_departing_city(city)
    select_drop_down_value(:name, DEPARTING_CITY_DROPDOWN, city)
  end

  def select_departing_month(month)
    select_drop_down_value(:name, DEPARTING_MONTH_DROPDOWN, month)
  end

  def select_departing_day(day)
    select_drop_down_value(:name, DEPARTING_DAY_DROPDOWN, day)
  end

  def select_arrival_city(city)
    select_drop_down_value(:name, ARRIVAL_CITY_DROPDOWN, city)
  end

  def select_return_month(month)
    select_drop_down_value(:name, RETURN_MONTH_DROPDOWN, month)
  end

  def select_return_day(day)
    select_drop_down_value(:name, RETURN_DAY_DROPDOWN, day)
  end

  def select_service_class(service_class)
    service_class_type = find_element(:xpath, "//input[@value='#{service_class}']")
    service_class_type.click
  end

  def select_airline_pref(pref)
    #pending-will code later on
  end

  def click_continue_btn
    click(:name, FIND_FLIGHTS_BTN)
  end
end