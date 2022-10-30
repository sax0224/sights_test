Feature: A simply POST API tests
Background:
  * header Accept = "Application/json"
  * def output = read("response.json")

Scenario: Test POST API
  Given   url "https://reqres.in/api"
  And     path "/users"
  And     request {"name":"Karis", "Job": "Engineer"}
  And     param page = 2
  When    method Post
  Then    status 201
  * print response

Scenario: Test POST API and check the response
  Given   url "https://reqres.in/api"
  And     path "/users"
  And     request {"name":"Karis", "Job": "Engineer"}
  And     param page = 2
  When    method Post
  Then    status 201
  Then    match response == {"name": "Karis","Job": "Engineer","id": "#string","createdAt": "#ignore"}
  * print response


  Scenario: Test POST API from JSON file
    Given   url "https://reqres.in/api"
    And     path "/users"
    And     request {"name":"Karis", "Job": "Engineer"}
    And     param page = 2
    When    method Post
    Then    status 201
    Then    match response == output
    Then    match $ == response
    * print response