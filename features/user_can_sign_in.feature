Feature: User can sign in
  As a user
  In order to access my account
  I should be able to log in

  Background:
    Given following user exist
      | email             | password    |
      | harald@norge.no   | OsloOslo123 |

  Scenario: User successfully logs in
    Given I visit the site
    And I click "Sign in"
    When I fill in "Email" with "harald@norge.no"
    And I fill in "Password" with "OsloOslo123"
    Then show me the page
    And I click "Log in"
    Then I should see message "Signed in successfully."

  Scenario: User inserts wrong email address
    Given I visit the site
    And I click "Sign in"
    When I fill in "Email" with "feil@norge.no"
    And I fill in "Password" with "OsloOslo123"
    And I click "Log in"
    Then I should see message "Invalid Email or password."

  Scenario: User inserts wrong password
    Given I visit the site
    And I click "Sign in"
    When I fill in "Email" with "harald@norge.no"
    And I fill in "Password" with "123"
    And I click "Log in"
    Then I should see message "Invalid Email or password."