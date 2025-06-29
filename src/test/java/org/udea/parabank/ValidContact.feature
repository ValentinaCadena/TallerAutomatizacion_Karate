@appcontact_validcontact
Feature: valid contact exists
Background:
* url baseUrl
* header Accept = 'application/json'

Scenario: login y validar contacto
# Login 
Given path '/users/login'
  And request { "email": "valentina.prueba@gmail.com", "password": "Hola12345" }
  When method POST
  Then status 201
  * def authToken = response.token

  # Validar contacto
  Given path '/contactList'
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
