Feature: User Logs Into Site
  As a RCN User
  I want to log into the RCN Presales BOM Site
  So that I can use the site
  
  Scenario: User logs in successfully
    Given that I am a user
    When I go to the home page 
    And I receive an authentication dialog
    And I enter a username and password
    Then I should log onto the site
      
  Scenario: User logs in but user service is down
    Given that I am a user
    When I go to the home page
    And I receive an authentication dialog
    And the user service is down
    And I enter a username and password 
    Then I go to the user error page
    And I should see "Please try again"
    And I go to the home page
    
  Scenario: User attempts to view restricted content without being logged in
    Given that I am a user
    And I am not logged in
    When I go to the home page
    Then I receive an authentication dialog
    