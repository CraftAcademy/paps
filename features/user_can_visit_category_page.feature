Feature:  User should be able to visit a category page
  As a subscriber
  In order to be able to find content of interest
  I would like to be able to filter articles by category

Background:
  Given the following categories exists
    | name    |
    | Fashion |
    | Tech    |
  And the following article exists
    | title               | content                       |
    | A Whole New World   | A new fantastic point of view |
    | A Whole New Article | A new fantastic article       |
  And the following article are assigned to categories
    | title                 |  category   |
    | A Whole New World     |  Fashion    |
    | A Whole New Article   |  Tech       |

Scenario: User visits the Fashion page
  Given I visit the Homepage
  When I click on the "Fashion" button
  Then I should be on the "Fashion" page
  And I should see "A Whole New World"
  And I should see "A new fantastic point of view"

Scenario: User visits the Tech page
  Given I visit the Homepage
  When I click on the "Tech" button
  Then I should be on the "Tech" page
  And I should see "A Whole New Article"
  And I should see "A new fantastic article"
