And /Select Flights page is displayed/ do
  select_flight_page = SelectFlightsPage.new(@driver)
  select_flight_page.verify
end