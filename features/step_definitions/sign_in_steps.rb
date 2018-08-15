Given /I open the website in a browser/ do
  #@driver.get "http://newtours.demoaut.com/mercurywelcome.php"
  @driver.navigate.to "https://newtours.herokuapp.com/"
end

# And /I login with credentials (.*) and (.*)/ do |user, pwd|
#   wait = Selenium::WebDriver::Wait.new(:timeout => 5)
#   wait.until { @driver.find_element(:name, 'userName').displayed? }
#   @driver.find_element(:name, 'userName').send_keys(user)
#   @driver.find_element(:name, 'password').send_keys(pwd)
#   @driver.find_element(:name, 'login').click
# end

And /I login with credentials (.*) and (.*)/ do |user, pwd|
  homepage = Homepage.new(@driver)
  homepage.login(user, pwd)
end


And /I login with credentials with (.*) and (.*)/ do |record|
  homepage = Homepage.new(@driver)
  homepage.login_with_record(record)
end


# Then /Flight Finder page is displayed/ do
#   wait = Selenium::WebDriver::Wait.new(:timeout => 10)
#   wait.until { @driver.find_element(:name, 'findFlights').displayed? }
#   if @driver.find_element(:name, 'findFlights').displayed?
#     puts "Test Case passed"
#   else
#     raise "Find Flights button not displayed!"
#   end
# end

