Feature: Edit articles
  As a Journalist/Editor
  In order to manage my contents and keep them updated
  I would like to be able to edit articles

  Background:
    Given  following article exists
    | title               | content                       |
    | A Whole New World   | A new fantastic point of view |

  Scenario: User can edit an article
    Given I am on the "A Whole New World" page
    When I click "Edit Article" link
    Then I fill in "Title" with "Do you know the Truth?"
    And I fill in "Content" with "It's inside of you"
    And I click "Submit" button
    Then I should be on the "Do you know the Truth?" page
    And I should see "Do you know the Truth?"
    And I should see "It's inside of you"
    Then I should see "Article successfully updated"
    And I should be on the "Index" page

  # Scenario: User edits the article and leave title empty
  #   Given I am on the "A Whole New World" article page
  #   When I click on "Edit Article"
  #   And I fill in "Title" with ""
  #   And I fill in "Content" with "A new fantastic point of view"
  #   And I click on "Submit"
  #   Then I should be on the "A Whole New World" page
  #   And I should see "Title field cannot be blank"
  #
  # Scenario: User edits the article and leave content empty
  #   Given I am on the "A Whole New World" article page
  #   When I click on "Edit Article"
  #   And I fill in "Title" with "A Whole New World"
  #   And I fill in "Content" with ""
  #   And I click on "Submit"
  #   Then I should be on the "A Whole New World" page
  #   And I should see "Content field cannot be blank"
  #
  # Scenario: User edits a article and leave title and content empty
  #   Given I am on the "A Whole New World" article page
  #   When I click on "Edit Article"
  #   And I fill in "Title" with ""
  #   And I fill in "Content" with ""
  #   And I click on "Submit"
  #   Then I should be on the "A Whole New World" page
  #   And I should see "Fields cannot be blank"
