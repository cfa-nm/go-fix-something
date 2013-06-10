Feature: Commenting on ideas

  Background:
    Given I am a signed in user
    And an idea exists

  Scenario: Viewing comments
    Given that idea has a comment
    When I visit that idea's page
    Then I should see the comment

  Scenario: Adding comments
    When I add a comment to that idea
    Then I should see the comment
