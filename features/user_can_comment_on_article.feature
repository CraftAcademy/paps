Feature: Subscriber can comment on article
  As a Subscriber
  In order to make my voice heard
  I would like to be able to leave a comment

  Background:
    Given  following article exists
    | title               | content                       |
    | A Whole New World   | A new fantastic point of view |

  Scenario: Successfully creates a comment on an article
    Given I am on the "A Whole New World" page
    When I fill in "Email" with "antonella@email.com"
    And I fill in "Comment" with "This article is fun"
    And I click "Submit comment" button
    Then I should see "antonella@email.com"
    And I should see "This article is fun"

  Scenario: User edits the article and leave content empty
    Given I am on the "A Whole New World" page
    When I fill in "Email" with "antonella@email.com"
    And I fill in "Comment" with ""
    And I click "Submit comment" button
    Then I should be on "A Whole New World" page
    And I should see "Field cannot be blank."
