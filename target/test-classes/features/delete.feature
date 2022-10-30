Feature: A simply DELETE API tests

  Scenario: Test DELETE API

    * def id = 2

    Given   url "https://reqres.in/api"
    And     path "/users", id
    When    method Delete
    Then    status 204
    * print response