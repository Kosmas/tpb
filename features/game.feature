Feature: Managing game

In order to be able to play a game of ten pin bowling
As a player
I want to setup players

Scenario: Start a new game
  Given I go to the game home page
  When I click on link "Start New Game"
  And I click on button "Create Game"
  Then I should see "Game has been created."
  And I should have one new game created

Scenario: Add a player to the game
  Given I go to the game home page
  When I click on link "Start New Game"
  And I click on button "Create Game"
  Then I should see "Game has been created."
  And I should have one new game created
  When I click on link "Add player"
  Then I should see "New Player"
  When I fill in "player_first_name" with "John"
  And I fill in "player_surname" with "Smith"
  And I click on button "Create Player"
  Then I should see "Player has been created"
  And I should have one new player created
