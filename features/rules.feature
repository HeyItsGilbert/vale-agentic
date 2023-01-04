Feature: Rules

  Scenario: Basic test case
    When I test "basic"
    Then the output should contain exactly:
      """
      fail.md:2:3:agentic.communal:Consider replacing 'improved'. It is communal vs agentic.
      fail.md:2:50:agentic.communal:Consider replacing 'team player'. It is communal vs agentic.
      fail.md:3:14:agentic.communal_alternative:Consider using 'energetic' instead of 'thoughtful'   
      """
