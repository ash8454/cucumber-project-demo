Feature: Logging into the Demo Website

  Scenario Outline: Verifying that the user can login to the Demo Website
    Given I open the website in a browser
    When I login with credentials <username> and <password>
    Then Flight Finder page is displayed

  Examples:
    | username     | password |
#    |  testing     |  testing        |
    | tutorial     | tut@orial     |
#    | asdfasdfasdf | asdf         |

