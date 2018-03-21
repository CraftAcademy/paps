@javascript
Feature: User is informed about his location
  As a visitor
  In order to get localized news
  I would like the application to know where I am

  Scenario: User is in Sweden
    Given I am at latitude: "59.334591", longitude: "18.063240"
    And I visit the site
    Then I should see "Rest of Sweden Edition"


  Scenario: User is in Gothenburg
    Given I am at latitude: "57.1", longitude: "11.9"
    And I visit the site
    Then I should see "Welcome Gothenburg Edition"
