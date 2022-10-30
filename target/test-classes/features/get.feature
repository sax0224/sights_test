Feature: A simply GET API tests

  Background:
    * url "http://192.168.252.131:8081/"

Scenario: Test a simple Get API

  Given   url 'http://192.168.252.131:8081/SightAPI'
  When    method Get
  Then    status 200

Scenario: Set variable to test Get API

  * def zone = "安樂"

  * print "This zone is :", zone
  Given   path "/SightAPI"
  And     param zone = zone
  When    method Get
  Then    status 200
  * print response[0].sightName
  And     match response[0].sightName == "一太e衛浴觀光工廠"
