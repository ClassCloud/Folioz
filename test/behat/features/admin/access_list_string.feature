@javascript @core @core_administration

Feature: Broken string in user accesslist report
In order to make sure user can read the strings
As an admin
I need to check they show no errors

Background:
 Given the following "institutions" exist:
     | name | displayname | registerallowed | registerconfirm |
     | instone | Institution One | ON | OFF |
 Given the following "users" exist:
     | username | password | email | firstname | lastname | institution | authname | role |
     | userA | Kupuhipa1 | test01@example.com | Pete | Mc | instone | internal | member |

Scenario: Accessing language string (Bug 1449350)
 Given I log in as "admin" with password "Kupuhipa1"
 And I choose "User search" in "Users" from administration menu
 And I check "selectusers_2"
 And I press "Get reports"
 When I press "Access list"
 Then I should not see "[[loggedin/view]]"
