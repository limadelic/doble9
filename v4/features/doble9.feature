Feature: DOBLE9 App Display
  As a user
  I want to see the DOBLE9 application
  So that I can start playing dominoes

  Scenario: Homepage displays DOBLE9
    Given I open the DOBLE9 app
    When the page loads
    Then I should see "DOBLE9" displayed on the page