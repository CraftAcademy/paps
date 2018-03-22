@javascript
Feature: User is informed about his location
  As a visitor
  In order to get localized news
  I would like the application to know where I am

Background:
  Given the following article exists
    | title               | content                       | latitude   | longitude |
    | A Whole New World   | A new fantastic point of view | 57.700501  | 11.975463 |
    | A Whole New Article | A new fantastic article       | 59.3345    | 18.0632   |
  And the following user exists
    | email           | password    | latitude   | longitude |
    | haral@norge.no | OsloOslo123  | 59.334591  | 18.063240 |
  And I am logged in as "haral@norge.no"

  Scenario: User is in Sweden
    Given I am at latitude: 59.33, longitude: 18.06
    And I visit the site
    Then I should see "Rest of Sweden Edition"

  Scenario: User is in Gothenburg
    Given I am at latitude: 57.700501, longitude: 11.975463
    And I visit the site
    Then I should see "Welcome Gothenburg Edition"
