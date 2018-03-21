
@javascript
Feature: Categories articles based on location for users
  As a Editor
  In order to display content relevant to my subscribers
  I would like to display content from their respective region.

Background:
  Given the following user exists
    | email           | password    | latitude   | longitude |
    | harald@norge.no | OsloOslo123 | 57.7       | 11.9      |
  And I am logged in as "harald@norge.no"
  And the following article exists
    | title               | content                       | latitude   | longitude |
    | A Whole New World   | A new fantastic point of view | 57.7       | 11.9      |
    | A Whole New Article | A new fantastic article       | 59.3       | 18.1      |
  And I am logged in as "harald@norge.no"
  And I am at latitude: "57.7", longitude: "11.9"

Scenario: User visit site and sould see atricles regardning Göteborg
  Given I visit the site
  Then I should see "A Whole New World"
  And I should not see message "A Whole New Article"
