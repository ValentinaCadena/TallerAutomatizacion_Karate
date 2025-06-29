@appcontact_createcontact
Feature: create contact to app contact

  Background:
    * url baseUrl
    * header Accept = 'application/json'
Scenario: Login y crear contacto
  # Login
  Given path '/users/login'
  And request { "email": "valentina.prueba@gmail.com", "password": "Hola12345" }
  When method POST
  Then status 200
  * def authToken = response.token

  # Crear contacto
  Given path '/contacts'
  And header Authorization = 'Bearer ' + authToken
  And request { "firstName": "Pruebas", "lastName": "UDEA", "birthdate": "1970-01-01", "email": "udea@fake.com", "phone": "8005555555", "street1": "1 Main St.", "street2": "Apartment A", "city": "Aranjuez", "stateProvince": "KS", "postalCode": "12345", "country": "COL" }
  When method POST
  Then status 201
