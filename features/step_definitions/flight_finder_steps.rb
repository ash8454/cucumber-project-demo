Then /Flight Finder page is displayed/ do
  flight_finder_page = FlightFinderPage.new(@driver)
  flight_finder_page.verify
end


When /I complete the Flight Finder page with (.*), (\d+) and (.*)/ do |type, num, depart_city|
   flight_finder = FlightFinderPage.new(@driver)
   flight_finder.select_trip_type(type)
   flight_finder.select_no_of_passengers(num)
   flight_finder.select_departing_city(depart_city)
   flight_finder.click_continue_btn
end


When /I complete the flight finder page with (.*)/ do |record|
  flight_finder = FlightFinderPage.new(@driver)
  flight_finder.complete_flight_finder_page(record)
end


Given /Flight Finder Page is displayed after loading the record/ do |record|
    home_page = Homepage.new(@driver)
    flight_finder_page = FlightFinderPage.new(@driver)
    home_page.login_with_record(record)
    flight_finder_page.complete_flight_finder_page(record)
end