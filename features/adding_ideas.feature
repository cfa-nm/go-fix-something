Feature: Adding new ideas
In order to make my ideas heard
As a citizen
I want to add new ideas

  Scenario: Creating as a signed in user
    Given I am a signed in user
    When I try to create an idea
    Then my idea should be in the system

  Scenario: Creating as a signed out user
    Given I am a signed out user
    When I try to create an idea
    Then I should be asked to sign up or sign in
    When I sign in
    Then my idea should be in the system

  Scenario: Creating as a guest
    When I try to create an idea
    Then I should be asked to sign up or sign in
    When I sign up
    Then my idea should be in the system
