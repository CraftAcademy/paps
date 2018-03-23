Feature: Edit articles
  As a Journalist/Editor
  In order to manage my contents and keep them updated
  I would like to be able to edit articles

  Background:
    Given the following article exists
    | title               | content                       |
    | A Whole New World   | A new fantastic point of view |

  Scenario: User can edit an article
    Given I am on the "A Whole New World" page
    When I click "Edit Article" link
    And I fill in "Title" with "Do you know the Truth?"
    And I fill in "Content" with "It's inside of you"
    And I click "Submit" button
    Then I should be on "Do you know the Truth?" page
    And I should see "Do you know the Truth?"
    And I should see "It's inside of you"
    Then I should see "Article successfully updated."

  Scenario: User edits the article and leave title empty
    Given I am on the "A Whole New World" page
    When I click "Edit Article" link
    And I fill in "Title" with ""
    And I fill in "Content" with "A new fantastic point of view"
    And I click "Submit" button
    Then I should be on "A Whole New World" page
    And I should see "Fields cannot be blank."

  Scenario: User edits the article and leave content empty
    Given I am on the "A Whole New World" page
    When I click "Edit Article" link
    And I fill in "Title" with "Do you know the Truth?"
    And I fill in "Content" with ""
    And I click "Submit" button
    Then I should be on "A Whole New World" page
    And I should see "Fields cannot be blank."

  Scenario: User edits a article and leave title and content empty
    Given I am on the "A Whole New World" page
    When I click "Edit Article" link
    And I fill in "Title" with ""
    And I fill in "Content" with ""
    And I click "Submit" button
    Then I should be on "A Whole New World" page
    And I should see "Fields cannot be blank."
