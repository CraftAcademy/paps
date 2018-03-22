Feature: Better orginized websitet with categories
  As a subscriber
  In order to be able to find content of interest
  I would like to be able to filter articles by category



Background:
  Given following article exists
    | title               | content                       |
    | A Whole New World   | A new fantastic point of view |
  And the following user exists
    | email           | password    |
    | harald@norge.no | OsloOslo123 |
  And the following categories exists
    | name    |
    | Fashion |
  And I am logged in as "harald@norge.no"

Scenario: User creates a new article and asign it to a category
  Given I am on the Create Article page
  Then I fill in "Title" with "A Whole New Article"
  And I fill in "Content" with "A new fantastic Article"
  And I select "Fashion" from "categories"
  When I click "Create Article" button
  Then I should be on "A Whole New Article" page
  And I should see "A Whole New Article"
  And I should see "A new fantastic Article"
  And I should see "Fashion"
