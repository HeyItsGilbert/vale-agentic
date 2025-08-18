Feature: Rules

  Scenario: Basic test case
    When I test "basic"
    Then the output should contain exactly:
      """
      fail.md:2:3:agentic.communal:Consider replacing 'improved'. It is communal vs agentic.
      fail.md:2:50:agentic.communal:Consider replacing 'team player'. It is communal vs agentic.
      fail.md:3:14:agentic.communal_alternative:Consider using 'energetic' instead of 'thoughtful'
      """

  Scenario: Expanded vocabulary catches new patterns
    When I test "expanded"  
    Then the output should contain "tried to"
    And the output should contain "executed"
    And the output should contain "unfortunately"
    And the output should contain "however"
    And the output should contain "team effort"
    And the output should contain "I coordinated"
