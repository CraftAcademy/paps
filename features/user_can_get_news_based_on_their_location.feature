
@javascript
Feature: Categories articles based on location for users
  As a Editor
  In order to display content relevant to my subscribers
  I would like to display content from their respective region.

  Background:
    Given the following user exists
      | email           | password    | latitude   | longitude |
      | harald@norge.no | OsloOslo123 |  57.700501 | 11.975463 |
    And the following article exists
      | title               | content                       | latitude   | longitude |
      | A Whole New World   | A new fantastic point of view |  57.700501 | 11.975463 |
      | A Whole New Article | A new fantastic article       | 59.334591  | 18.063240 |
    And I am logged in as "harald@norge.no"
    And I am at latitude: 57.700501, longitude: 11.975463

  Scenario: User visit site and should see articles regarding Göteborg
    Given I visit the site
    Then I should see "Local Articles"
    And I should see "A Whole New World"
    And I should see "All Articles"
    And I should see "A Whole New Article"

  Scenario: User is in Zurich
    Given I am at latitude: 47.3769, longitude: 8.5417
    And I visit the site
    Then I should see "A Whole New World"
    And I should see "A Whole New Article"
