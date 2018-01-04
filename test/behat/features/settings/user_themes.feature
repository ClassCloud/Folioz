@javascript @core @core_view
Feature: Allow user themes on pages
In order to allow a user theme on a page
Enable "Users can choose page themes" setting
Log in as user and confirm it works

Background:
  Given the following "users" exist:
    | username | password | email | firstname | lastname | institution | authname | role |
    | UserA | Kupuhipa1 | UserA@example.com | Angela | User | mahara | internal | member |
  And the following "pages" exist:
    | title | description | ownertype | ownername |
    | Page UserA_01 | Page 01| user | UserA |

Scenario: Activate page themes setting and edit a page (Bug 1591304)
 Given I log in as "admin" with password "Kupuhipa1"
 And I choose "Configure site" from administration menu
 # I set the page themes option
 And I expand the section "User settings"
 And I enable the switch "Users can choose page themes"
 And I press "Update site options"
 And I log out
 # Now set a theme as a user and confirm logo changes
 Given I log in as "UserA" with password "Kupuhipa1"
 And I follow "Page UserA_01"
 And I follow "Edit"
 And I select "Modern" from "viewtheme"
 Then the "div#logo-area" element should contain "/theme/modern/images/site-logo"
