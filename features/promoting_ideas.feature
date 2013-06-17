Feature: Promoting ideas

  Scenario:
    Given I am a signed in user
    And an idea I created exists
    When I promote that idea
    Then that idea should be a project
