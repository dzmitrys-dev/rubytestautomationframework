Feature: Google search
  Scenario: Google "Test automation"
    Given I am on Google search page
    When I search for "Test Automation Engineer"
    Then "Test Automation Engineer" is present on the results page