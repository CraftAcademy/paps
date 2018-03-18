  Feature: User can pay for subscription using credit card
      As a registered user
      In order to access all content
      I would  like to be able to purchase a subscription

    Background:
      Given the following user exists
        | email           | password    |
        | harald@norge.no | OsloOslo123 |
      And I am logged in as "harald@norge.no"
      Given I am on the create subscription page
      And I click on the "Pay with Card" button

    @javascript
    Scenario: User signs up for a subscription with valid credit card
      And I fill in stripe field "Card number" with "4242 4242 4242 4242"
      And I fill in stripe field "CVC" with "123"
      And I fill in stripe field "Expiry" with "11/2022"
      And submit the stripe form
      Then I should be on the homepage
      Then I should see message "Welcome as a subscriber!"

    @javascript
    Scenario: Users card number is incorrect
      And I fill in stripe field "Card number" with "4242 4242 4242 4241"
      And I fill in stripe field "CVC" with "123"
      And I fill in stripe field "Expiry" with "11/2022"
      And submit the stripe form
      Then I should not see message "Welcome as a subscriber!"

    @javascript
    Scenario: Users card has expired
      And I fill in stripe field "Card number" with "4000 0000 0000 0069"
      And I fill in stripe field "MM / YY" with "12/2021"
      And I fill in stripe field "CVC" with "123"
      And submit the stripe form
      Then I should not see message "Welcome as a subscriber!"

    @javascript
    Scenario: Users card cvc is incorrect
      And I fill in stripe field "Card number" with "4000 0000 0000 0127"
      And I fill in stripe field "MM / YY" with "12/2021"
      And I fill in stripe field "CVC" with "123"
      And submit the stripe form
      Then I should not see message "Welcome as a subscriber!"

    @javascript
    Scenario: Processing error
      And I fill in stripe field "Card number" with "4000 0000 0000 0119"
      And I fill in stripe field "MM / YY" with "12/2021"
      And I fill in stripe field "CVC" with "123"
      And submit the stripe form
      Then I should not see message "Welcome as a subscriber!"

    @javascript
    Scenario: Users card is declined
      And I fill in stripe field "Card number" with "4000 0000 0000 0002"
      And I fill in stripe field "MM / YY" with "12/2021"
      And I fill in stripe field "CVC" with "123"
      And submit the stripe form
      Then I should not see message "Welcome as a subscriber!"
