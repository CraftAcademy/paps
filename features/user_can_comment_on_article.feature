Feature: Subscriber can comment on article
  As a Subscriber
  In order to make my voice heard
  I would like to be able to leave a comment

  Background:
    Given the following article exists
    | title               | content                       |
    | A Whole New World   | A new fantastic point of view |
    And I am on the "A Whole New World" page

  Scenario: Successfully creates a comment on an article
    When I fill in "Email" with "antonella@email.com"
    And I fill in "Comment" with "This article is fun"
    And I click "Submit comment" button
    Then I should see "antonella@email.com"
    And I should see "This article is fun"

  Scenario: User comments the article and leave content empty
    When I fill in "Email" with "antonella@email.com"
    And I fill in "Comment" with ""
    And I click "Submit comment" button
    Then I should be on "A Whole New World" page
    And I should see "Field cannot be blank."

  Scenario: User comments the article and leave email empty
    When I fill in "Email" with ""
    And I fill in "Comment" with "This article is fun"
    And I click "Submit comment" button
    Then I should be on "A Whole New World" page
    And I should see "Field cannot be blank."
