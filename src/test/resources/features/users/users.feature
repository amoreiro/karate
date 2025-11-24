Feature: Gestión de Usuarios
  Como usuario del sistema
  Quiero poder gestionar usuarios a través de la API
  Para realizar operaciones CRUD completas

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  @users @get
  Scenario: Obtener lista de usuarios con paginación
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    
    # Validar estructura de respuesta
    And match response contains 
    """
    {
      page: '#number',
      per_page: '#number',
      total: '#number',
      total_pages: '#number',
      data: '#[_]',
      support: '#object'
    }
    """
    
    # Validar primer usuario con schema
    And match response.data[0] == read('user-schema.json')
    
    And print 'Total de usuarios:', response.total

  @users @get
  Scenario: Obtener un usuario específico por ID
    Given path '/users/2'
    When method GET
    Then status 200
    
    # Validar que el usuario tiene la estructura correcta
    And match response.data == read('user-schema.json')
    
    # Validar campos específicos
    And match response.data.id == 2
    And match response.data.email == '#string'
    And match response.data.email contains '@'

  @users @post
  Scenario: Crear un nuevo usuario
    # Leer payload desde archivo JSON
    * def newUser = read('user-payloads.json').createUser
    
    Given path '/users'
    And request newUser
    When method POST
    Then status 201
    
    # Validar respuesta
    And match response.name == newUser.name
    And match response.job == newUser.job
    And match response.id == '#present'
    And match response.createdAt == '#present'
    
    # Guardar ID para usar en otros tests
    * def userId = response.id
    And print 'Usuario creado con ID:', userId

  @users @post @example
  Scenario: Crear usuario - Ejemplo inline
    Given path '/users'
    And request 
    """
    {
      "name": "María García",
      "job": "QA Engineer"
    }
    """
    When method POST
    Then status 201
    And match response.name == 'María García'
    And match response.job == 'QA Engineer'

  @users @put
  Scenario: Actualizar un usuario existente
    * def updateUser = read('user-payloads.json').updateUser
    
    Given path '/users/2'
    And request updateUser
    When method PUT
    Then status 200
    
    And match response.name == updateUser.name
    And match response.job == updateUser.job
    And match response.updatedAt == '#present'

  @users @patch
  Scenario: Actualizar parcialmente un usuario
    Given path '/users/2'
    And request { job: 'Senior QA Engineer' }
    When method PATCH
    Then status 200
    And match response.job == 'Senior QA Engineer'
    And match response.updatedAt == '#present'

  @users @delete
  Scenario: Eliminar un usuario
    Given path '/users/2'
    When method DELETE
    Then status 204

  @users @get @not-found
  Scenario: Intentar obtener un usuario que no existe
    Given path '/users/999999'
    When method GET
    Then status 404
    And match response == {}

  # ============================================
  # EJERCICIO PARA EL ALUMNO
  # ============================================
  # TODO: Agregar un nuevo escenario que:
  # 1. Cree un usuario
  # 2. Lo actualice
  # 3. Lo elimine
  # 4. Verifique que ya no existe (404)
  
  @users @exercise @ignore
  Scenario: EJERCICIO - Flujo completo de usuario
    # COMPLETAR ESTE ESCENARIO
    * print 'Implementa aquí el flujo completo'
