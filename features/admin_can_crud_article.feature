Feature: Admin can add an article
  As an Admin
  In order to add articles on the website
  I would like to get CRUD access on my dashboard

  Background:
    Given The following Admin exists
      | email               | password  |
      | admin@example.com   | password  |
    Given The following Article exists
      | title               | content   |
      | MyString            | MyText    |
    Given I am on the Admin login page
    Given I fill in field "AdminUserEmail" with "admin@example.com"
    Given I fill in field "AdminUserPassword" with "password"
    Given I click submit

  Scenario: Admin successfully adds an article
    When I click Articles link
    And I click admin article page link "New Article"
    Then I should be on "NewAdminArticlePath" dashboard page
    And I fill in field "ArticleTitle" with "string"
    And I fill in field "ArticleContent" with "string"
    And I click article link "Create Article"
    Then I should see "Article was successfully created."

  Scenario: Admin fails to fill in field
    When I click Articles link
    And I click admin article page link "New Article"
    Then I should be on "NewAdminArticlePath" dashboard page
    And I fill in field "ArticleTitle" with " "
    And I fill in field "ArticleContent" with "string"
    And I click article link "Create Article"
    Then I should see "can't be blank"

  Scenario: Admin successfully edits an article
    When I click Articles link
    And I click admin article page link "Edit"
    And I fill in field "ArticleTitle" with "string"
    And I fill in field "ArticleContent" with "string1"
    And I click article link "Update Article"
    Then I should see "Article was successfully updated."

  Scenario: Admin successfully deletes an article
    When I click Articles link
    And I click admin article page link "Delete"
    And I should see "Article was successfully destroyed."
