@ignore
Feature: Autenticación Reutilizable
  Este feature se usa desde otros features para obtener tokens de autenticación
  El tag @ignore previene que se ejecute como test independiente

  Background:
    * url baseUrl

  Scenario: Obtener token de autenticación (Ejemplo)
    # NOTA: Este es un ejemplo de patrón de autenticación
    # La API reqres.in no requiere autenticación real
    # Pero este patrón es útil para APIs que sí la requieren
    
    # Ejemplo de login con usuario y contraseña
    Given path '/login'
    And request 
    """
    {
      "email": "eve.holt@reqres.in",
      "password": "cityslicka"
    }
    """
    When method POST
    Then status 200
    
    # Guardar el token para usar en otros features
    * def authToken = response.token
    
    # Este token ahora está disponible cuando se llama este feature
    # Uso desde otro feature:
    # * def authResult = call read('classpath:features/common/auth.feature')
    # * def token = authResult.authToken
    # * header Authorization = 'Bearer ' + token

  Scenario: Obtener token anónimo (Ejemplo OAuth2)
    # Ejemplo de autenticación OAuth2 client_credentials
    # Útil para APIs enterprise
    
    Given url 'https://oauth.ejemplo.com/token'
    And form field grant_type = 'client_credentials'
    And form field client_id = 'mi-client-id'
    And form field client_secret = 'mi-client-secret'
    When method POST
    Then status 200
    
    * def anonymousToken = response.access_token
    
    # Uso:
    # * def tokenResult = call read('classpath:features/common/auth.feature@oauth')
    # * def token = tokenResult.anonymousToken
