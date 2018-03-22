Feature:
  As a user
  In order to know who's the author of an article
  I should see the author's name in the article

  Background:
    Given I visit the Homepage
    Given the following user exists
      | email           | password    | password_confirmation |
      | harald@norge.no | OsloOslo123 | OsloOslo123           |
    And I am logged in as "harald@norge.no"

  Scenario: Successfully create an article
    When I click "New Article" link
    Then I fill in "Title" with "A Whole New World"
    And I fill in "Content" with "A new fantastic point of view"
    And I click "Create Article" button
    Then I should be on "A Whole New World" page
    And I should see "harald@norge.no"
