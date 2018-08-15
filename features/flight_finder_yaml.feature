Feature: Flight Finder Page

  Scenario Outline: Finding the Flights from Flight Finder Page Using YAML file

    Given I open the website in a browser
    And I login with credentials with <record>
    And Flight Finder page is displayed
    When I complete the flight finder page with <record>
#    Then Flight Finder page is displayed


    Examples:
  | record      |
  |  record1    |
#  |  record2    |