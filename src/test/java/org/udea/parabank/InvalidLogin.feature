@appcontact_Invalidlogin
Feature: Invalid Login to app contact

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Customer Invalid Login
    Given path '/users/login'
    And request {"email": "valentinafake@gmail.com","password": "Hola12345"}
    When method POST
    Then status 400
