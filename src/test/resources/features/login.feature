Feature: Login API

  Scenario: Successful login with valid credentials
    Given url baseUrl + '/api/admin/login'
    And request
      """
      {
        "username": "admin",
        "password": "admin123"
      }
      """
    When method POST
    Then status 200
    And match response contains { token: '#string' }

  Scenario: Login with invalid password
    Given url baseUrl + '/api/admin/login'
    And request
      """
      {
        "username": "admin",
        "password": "wrongpass"
      }
      """
    When method POST
    Then status 401
    And match response.message == 'Invalid credentials'