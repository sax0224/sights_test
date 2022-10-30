Feature: A simple API test for data

  Scenario Outline: Retry until demo

    Given url "https://reqres.in/api"
    And path "/users/<id>"
    When method get
    Then status 200
    * print response["data"].first_name
    And match response["data"].first_name == "<first_name>"

    Examples:
      | id |  first_name |
      | 1  |  George     |
      | 2  |  Janet      |
      | 3  |  Emma       |