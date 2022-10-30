Feature: A simple PUT API test

Scenario: Test PUT API

  * def id = 2

  Given   url "https://reqres.in/api"
  And     path "/users", id
  And     request {"name":"Karis", "Job": "Engineer"}
  When    method Put
  Then    status 200
  * print response
