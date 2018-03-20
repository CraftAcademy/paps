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
    When I
