Feature: View graph

  Scenario: Successful view graph
    Given a user visits a patient page
    When they press 24 hour button
    Then they should see a graph with 24 hours of data