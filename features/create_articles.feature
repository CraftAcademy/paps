Feature: Create articles
  As a journalist
  In order to attract subscribers
  I would like to be able to create articles

  Background:
    Given the following categories exists
      | name    |
      | Fashion |

    And I visit the Homepage

  Scenario: Successfully create an article
    When I click "New Article" link
    Then I fill in "Title" with "A Whole New World"
    And I fill in "Content" with "A new fantastic point of view"
    And I select "Fashion" from "categories"
    And I click "Create Article" button
    Then I should be on "A Whole New World" page
    And I should see "Article was successfully created."
    And I should see "A Whole New World"
    And I should see "A new fantastic point of view"
    Then I should be on article page

  Scenario: Failed to fill in content field
    When I click "New Article" link
    Then I fill in "Title" with "A Whole New World"
    Then I fill in "Content" with " "
    And I click "Create Article" button
    Then I should be on article page

  Scenario: Failed to fill in title field
    When I click "New Article" link
    Then I fill in "Title" with " "
    Then I fill in "Content" with "New content"
    And I click "Create Article" button
    Then I should be on article page
