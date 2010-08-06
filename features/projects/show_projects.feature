Feature: Show Projects
  As a salesperson
  In order to take a look at my projects 
  I should be able to view my projects 

  @user_with_two_projects
  Scenario: View my projects from the dashboard when I have projects
    Given I am logged in
    When I go to the dashboard page
    Then I should see a list of my projects
    
  @user_with_no_projects
  Scenario: View my projects from the dashboard when I have no projects
    Given I am logged in                  
    When I go to the home page
    Then I should see "You don't have any projects"
    And I should see "Add a project" 
  
  @user_with_two_projects             
  Scenario: View my projects from the projects index page
    Given I am logged in 
    When I go to the projects page
    Then I should see a list of my projects
    
  @user_with_one_project
  Scenario: View my project from the show project page 
    Given I am logged in                  
    When I go to the show project page
    Then I should see "Project "
    And I should see "Putting in DWDM in 111 8th Street"
    And I should see "Project Cost: $0.00" 

  
  