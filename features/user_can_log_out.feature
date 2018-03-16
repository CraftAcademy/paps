Feature: User can log out
  As a user
  In order to safely leave the site
  I should be able to logout from my account
  
  Background:
    Given the following user exists
      | email           | password    | password_confirmation |
      | harald@norge.no | OsloOslo123 | OsloOslo123           |
    And I am logged in as "harald@norge.no"

  Scenario: User logs out
    Given I visit the site
    And I click "Log out"
    And I should see message "Signed out successfully."
