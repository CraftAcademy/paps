Feature: Admin can add an article
  As an Admin
  In order to add articles on the website
  I would like to get CRUD access on my dashboard

  Background:
  Given The following Admin exists
    | email               | password  |
    | admin@example.com   | password  |
  And I'm logged in as the admin
  And I go to the dashboard

  Scenario: Admin successfully adds an article
    When I click dashboard link Articles
    And I click article link "Create one"
    Then I should be on "new_admin_article_path" page
    And I fill in field article_title
    And I fill in field article_content
    And I click article link "Create Article"
    Then I should see "Article was successfully created."
