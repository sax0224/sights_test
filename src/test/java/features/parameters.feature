Feature: A simply GET API tests

Scenario: Use parameters to test Get API
  Given   url "https://reqres.in/api"
  And     path "/users"
  And     param page = 2
  When    method Get
  Then    status 200
  Then    match response["data"][0].first_name == "Michael"
  Then    match response["data"] == "#[6]"
