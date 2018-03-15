Feature: Create articles
  As a journalist
  in order to attract subscribers
  I would like to be able to create articles

  Background:
    Given I visit the "index" page
    When I click "New Article" link

  Scenario: Successfully create an article
    When I fill in "Title" with "A Whole New World"
    And I fill in "Content" with "A new fantastic point of view"
    And I click "Create Article" button
    Then I should be on "A Whole New World" page
    And I should see "Article was successfully created."
    And I should see "A Whole New World"
    And I should see "A new fantastic point of view"
