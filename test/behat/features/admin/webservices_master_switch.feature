@javascript @core @core_administration
Feature: To enable webservices via the webservices configuration form
In order to use webservices
As an admin
So I can benefit from the cross over of Moodle/Mahara


Background:
Given the following "users" exist:
     | username | password | email | firstname | lastname | institution | authname | role |
     | userA | Kupuhipa1 | test01@example.com | Pete | Mc | mahara | internal | member |

Scenario: Turning master switch on
 Given I log in as "admin" with password "Kupuhipa1"
 And I choose "Configuration" in "Web services" from Admin menu
 # Turning the master switch on
 And I enable the switch "Accept incoming web service requests:"
 And I choose "Test client" in "Web services" from Admin menu
 And I should not see "The web service authentication plugin is disabled"
 And I log out
 # Logging in as student to try turn switch on
 When I log in as "userA" with password "Kupuhipa1"
 Then I should see "Pete Mc"
 # Checking the student cant access the link
 And "Administration" "link" should not be visible
 And "Web services" "link" should not be visible
