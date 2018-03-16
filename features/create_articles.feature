Feature: Create articles
  As a journalist
  In order to attract subscribers
  I would like to be able to create articles

  Background:
    Given I visit the Homepage

  Scenario: Successfully create an article
    When I click "New Article" link
    Then I fill in "Title" with "A Whole New World"
    And I fill in "Content" with "A new fantastic point of view"
    And I click "Create Article" button
    Then I should see "Article Saved"
