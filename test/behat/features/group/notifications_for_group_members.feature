@javascript @core @core_group
Feature: Sending notification message when someone leaves a comment in a group page
    In order to notify a user of a comment on a group page
    As a user I add a comment
    So another person can log in and see a notification message


Background:
    Given the following "users" exist:
     | username  | password  | email | firstname | lastname  | institution   | authname  |role   |
     | bob   | Kupuhipa1   | bob@example.com   | Bob   | Bobby | mahara    | internal  | member    |
     | jen   | mahara1   | jen@example.com   | Jen   | Jenny | mahara | internal  | member    |

    Given the following "groups" exist:
     | name | owner | description | grouptype | open | invitefriends | editroles | submittableto | allowarchives | members | staff |
     | Test group 1 | admin | This is group 01 | standard | ON | ON | all | ON | ON | bob , jen  | jen |


    Given the following "pages" exist:
     | title | description| ownertype | ownername |
     | Testing group page 01 | This is the page 01 of the group 01 | group | Test group 1 |



Scenario: Adding a comment on a group page (Bug 1426983)
    Given I log in as "bob" with password "Kupuhipa1"
    And I choose "Groups" from main menu
    And I follow "Test group 1"
    And I follow "Pages and collections (tab)"
    # And I click on "Pages"
    And I follow "Testing group page 01"
    And I fill in "Testing comment notifications" in editor "Comment"
    And I press "Comment"
    # Log out as user 1
    And I log out
    # Log in as "Admin" user
    When I log in as "admin" with password "Kupuhipa1"
    # Checking notification display on the dashboard
    Then I should see "New comment on Testing group page 01"
    # Checking notifications also appear in my inbox
    And I choose "mail" from user menu by id
    And I follow "New comment on Testing group page 01"
    And I should see "Testing comment notifications"
