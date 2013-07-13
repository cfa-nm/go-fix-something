@javascript
Feature: Voting on ideas

  Background:
    Given I am a signed in user
    And an idea exists
    And I am on that idea's page

  Scenario: Voting on ideas
    When I upvote that idea
    Then the idea should be upvoted

  Scenario: Voting once
    When I upvote that idea
    Then I should not be able to upvote the idea again

  Scenario: Disallow voting on my own ideas
    Given an idea I created exists
    Then I should not be able to upvote the idea

  Scenario: Changing my vote
    When I downvote that idea
    And I upvote that idea
    Then the idea should be upvoted

  Scenario: Cancelling my vote
    When I upvote that idea
    And I cancel my vote
    Then the idea should not be upvoted
