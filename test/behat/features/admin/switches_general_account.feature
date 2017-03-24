@javascript @core @core_administration
Feature: Switches on general accounts
In order to change settings
As an admin
I need to be able to switch switches back and forth

Scenario: Turning switchboxes on and off in diff areas (Bug 1431569)
 Given I log in as "admin" with password "Kupuhipa1"
 # In the adding users area
 When I choose "Add user" in "Users" from administration menu
 And I press "General account options"
 # Changing the switches to their opposite setting
 And I set the following fields to these values:
 | HTML editor | 0 |
 | Disable email | 1 |
 | Show controls to add and remove columns when editing a page | 1 |
 | Multiple journals | 1 |
 | Dashboard information | 0 |
 And I press "×" in the "div.modal-header" "css_element"
 And I fill in the following:
 | firstname   | white  |
 | lastname    | valiant    |
 | email       | wv@example.com |
 | username    | wval  |
 | password    | mahara1  |
 And I press "Create user"
 # In the Admin block adding users by CSV area
 And I choose "Add users by CSV" in "Users" from administration menu
 And I follow "General account options"
 # Changing the switches to the opposite setting
 And I set the following fields to these values:
 | HTML editor | 0 |
 | Disable email | 1 |
 | Show controls to add and remove columns when editing a page | 1 |
 | Multiple journals | 1 |
 | Dashboard information | 0 |
 And I attach the file "UserCSV.csv" to "CSV file"
 And I disable the switch "Force password change"
 And I disable the switch "Email users about their account"
 And I press "Add users by CSV"
 # Navigating to the account index
 And I log out
 Then I log in as "bob01" with password "Mahara1"
 And I go to "account/index.php"
 And I should not see "Undefined index:"
 # Changing the switches to their opposite setting
 And I set the following fields to these values:
 | HTML editor | 1 |
 | Disable email | 0 |
 | Show controls to add and remove columns when editing a page | 0 |
 | Multiple journals | 0 |
 | Maximum tags in cloud | 15 |
 | Dashboard information | 1 |
 And I press "Save"
