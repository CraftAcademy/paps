Feature: Admin login
  As an Editor
  In order to manage the application content
  I should be able to have access to a private admin dashboard

  Background:
    Given The following user exists
      | email               | password  |
      | admin@example.com   | password  |
    And I am on the Admin login page

  Scenario: Admin successfully logs in
    When I fill in "admin_user_email" with "admin@example.com"
    And I fill in "admin_user_password" with "password"
    Then I click submit
    And I should be redirected to admin dashboard
