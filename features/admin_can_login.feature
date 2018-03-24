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
   When I fill in field "AdminUserEmail" with "admin@example.com"
   And I fill in field "AdminUserPassword" with "password"
   Then I click submit
   And I should be redirected to admin dashboard

 Scenario: Admin enters incorrect password
   When I fill in field "AdminUserEmail" with "admin@example.com"
   And I fill in field "AdminUserPassword" with "password1"
   Then I click submit
   And I should see "Invalid Email or password"

 Scenario: Admin leaves field empty
   When I fill in field "AdminUserEmail" with "admin@example.com"
   And I fill in field "AdminUserPassword" with " "
   Then I click submit
   And I should see "Invalid Email or password"
