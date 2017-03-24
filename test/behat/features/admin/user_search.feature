@javascript @core @core_administration
Feature: Configuration on user search page
In order to change the configuration of the user search page
As an admin
So I can benefit from the use of different configurations

Background:
 Given the following "users" exist:
     | username | password | email | firstname | lastname | institution | authname | role |
     | userA | Kupuhipa1 | test01@example.com | Pete | Mc | mahara | internal | admin |

Scenario: Testing functions for user search page (Bug 1431569)
 Given I log in as "admin" with password "Kupuhipa1"
 And I choose "User search" in "Users" from administration menu
 And I follow "Advanced options"
 And I follow "P" in the "div#firstnamelist" "css_element"
 And I follow "userA"
 And I should see "Account settings | Pete Mc (userA)"
 # Flicking the switches to new settings
 And I set the following fields to these values:
 | Force password change on next login  | 1 |
 | Disable email | 1 |
 And I press "Save changes"

 # Check that I can do user search when 'Email address' option is on
 Given the following plugin settings are set:
 | plugintype | plugin  | field | value |
 | artefact | internal | profilepublic | email |
 And I set the following fields to these values:
 | Search users | test01@example.com |
 And I press the key "Enter" in the "Search users" field
 Then I should see "userA"
