Feature: Tables API

  Background:
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
    * def token = response.token

  Scenario: Get all tables
    Given url baseUrl + '/api/tables'
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 200