Feature: Delete articles
  As a Journalist/Editor
  In order to manage my contents and keep them updated
  I would like to be able to delete articles

  Background:
    Given the following article exists
    | title               | content                       |
    | A Whole New World   | A new fantastic point of view |

  Scenario: User can delete an article
    Given I am on the "A Whole New World" page
    When I click "Delete Article" link
    Then I should see "Article successfully deleted."
