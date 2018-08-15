Feature: Flight Finder Page

  Background:
    Given I open the website in a browser
    And I login with credentials test and test


  Scenario Outline: Finding the Flights from Flight Finder Page 1
    Given Flight Finder page is displayed
    When I complete the Flight Finder page with <type>, <passenger_numbers> and <departing_city>
    Then Select Flights page is displayed


  Examples:
    | type           | passenger_numbers     | departing_city  |
    |  Round Trip    |      2                |  London       |


  Scenario Outline: Finding the Flights from Flight Finder Page 2
    Given Flight Finder page is displayed
    When I complete the flight finder page with <record>
    Then Select Flights page is displayed


    Examples:
      | record    |
    |  record1    |

