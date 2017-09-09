@javascript @core @core_group
Feature: Creating different types of groups
    In order to create different types of groups
    As an admin
    So I can check that they are accessible

Scenario: Creating a group and adding users to it (Selenium)
    # Log in as "Admin" user
    Given I log in as "admin" with password "Kupuhipa1"
    # Verifying log in was successful
    And I should see "Admin User"
    # Create a Friend invitation only group
    When I choose "Groups" from main menu
    And I follow "Create group"
    And I fill in "Group name" with "Admin Test Group"
    And I disable the switch "Open"
    And I enable the switch "Friend invitations"
    And I press "Save group"
    And I should see "Journals" in the "div.arrow-bar" "css_element"
    # Create Request only group
    And I choose "Groups" from main menu
    And I follow "Create group"
    And I fill in "Group name" with "Admin VIP Group"
    And I disable the switch "Open"
    And I enable the switch "Request"
    And I press "Save group"
    # Create Open group
    And I choose "Groups" from main menu
    And I follow "Create group"
    And I fill in "Group name" with "Public discussion"
    And I enable the switch "Participation report"
    And I press "Save group"
    # Create Controlled group
    And I choose "Groups" from main menu
    And I follow "Create group"
    And I fill in "Group name" with "Controlled groups"
    And I disable the switch "Open"
    And I enable the switch "Controlled"
    And I press "Save group"
    # Verify all groups has been created
    And I choose "Groups" from main menu
    Then I should see "Admin Test Group"
    And I should see "Admin VIP Group"
    And I should see "Controlled Group"
    And I should see "Public discussion"
    # Check if the group report page is there
    And I follow "Public discussion"
    And I follow "Report" in the ".arrow-bar" "css_element"
    Then I should see "There are no pages shared with this group yet"
