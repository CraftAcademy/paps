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
    When I fill in "Comment" with "This article is fun"
    And I click "Submit comment" button
    Then I should see "This article is fun"
