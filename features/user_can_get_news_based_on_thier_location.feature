Feature: Categories articles based on location for users
  As a Editor
  In order to display content relevant to my subscribers
  I would like to display content from their respective region.

Background:
  Given the following user exists
    | email           | password    | password_confirmation |
    | harald@norge.no | OsloOslo123 | OsloOslo123           |
  And I am logged in as "harald@norge.no"
  And the following article exists
    | title               | content                       | location   |
    | A Whole New World   | A new fantastic point of view | Gothenburg |
    | A Whole New Article | A new fantastic article       | Stockholm  |
  And I am logged in as "harald@norge.no"
  And I am at latitude: "57.7", longitude: "11.9"


Scenario: User visit site and sould see atricles regardning Göteborg
  Given I visit the site
  Then I should see "A Whole New World"
  And I should not see message "A Whole New Article"
