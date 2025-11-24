Feature: Health Check
  Verificación básica de que la API está disponible y responde correctamente

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  @smoke @health-check
  Scenario: La API responde correctamente
    Given path '/users'
    And param page = 1
    When method GET
    Then status 200
    And match response.page == 1
    And match response.data == '#[_]'
    And print 'API está funcionando correctamente ✅'

  @smoke @health-check
  Scenario: La API retorna estructura válida
    Given path '/users/2'
    When method GET
    Then status 200
    And match response.data == '#object'
    And match response.data.id == '#number'
    And match response.data.email == '#string'
    And match response.data.first_name == '#string'
    And match response.data.last_name == '#string'
    And print 'Estructura de respuesta válida ✅'
