Feature: Managing game

In order to be able to play a game of ten pin bowling
As a player
I want to setup players

Scenario: Add the number of player for the game
  Given I go to the game home page
  When I add '4' players
  Then I should see '4' name input fields
