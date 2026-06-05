Feature: Category filter
  As a todo list user
  I want to filter todos by category
  So that I can focus on a specific type of task

  Background:
    Given the following todos exist:
      | description | category |
      | Work task   | work     |
      | Study task  | study    |

  Scenario: User filters todos by an existing category
    When I visit the todos page
    And I filter todos by "work"
    Then I should see "Work task"
    And I should not see "Study task"

  Scenario: Category filter with no matches
    When I visit the todos page
    And I filter todos by "personal"
    Then I should not see "Work task"
    And I should not see "Study task"
