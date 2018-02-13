@javascript @core @core_administration
Feature: Validating multiple notification settings
Log in as admin and as a user to confirm default notification options are available in the select box
Secondly, check that the notification types are listed alphabetically

Background:
    Given the following "users" exist:
    | username  | password  | email | firstname | lastname  | institution   | authname  | role  |
    | UserA   | Kupuhipa1   | UserA@example.org   | Angela   | User | mahara    | internal  | member    |

Scenario: Confirm that multiple notification choices are available (Bug #1299993)
    # Log in as admin
    Given I log in as "admin" with password "Kupuhipa1"
    # Navigating to notification settings
    And I choose "Site options" in "Configure site" from administration menu
    And I follow "Notification settings"
    # Verifying "None" option is not available for these notifications
    And the "System message" field should not contain "None"
    And the "Message from other users" field should not contain "None"
    # Verifying all options are available for the rest of Admin notifications
    And I select "Email" from "Contact us"
    And I select "Email digest" from "Contact us"
    And I select "Inbox" from "Contact us"
    And I select "None" from "Contact us"
    And I select "Email" from "Objectionable content"
    And I select "Email digest" from "Objectionable content"
    And I select "Inbox" from "Objectionable content"
    And I select "None" from "Objectionable content"
    And I select "Email" from "Repeat virus upload"
    And I select "Email digest" from "Repeat virus upload"
    And I select "Inbox" from "Repeat virus upload"
    And I select "None" from "Repeat virus upload"
    And I select "Email" from "Virus flag release"
    And I select "Email digest" from "Virus flag release"
    And I select "Inbox" from "Virus flag release"
    And I select "None" from "Virus flag release"
    And I select "Email" from "Objectionable content in forum"
    And I select "Email digest" from "Objectionable content in forum"
    And I select "Inbox" from "Objectionable content in forum"
    And I select "None" from "Objectionable content in forum"
    And I press "Update site options"
    # Log out as "Admin User"
    And I log out
    # Logging in as user1
    Then I log in as "UserA" with password "Kupuhipa1"
    # Navigating to notification settings
    And I choose "Notifications" in "Settings" from user menu
    # Verifying the "None" option is not available for the following notifications
    And the "System message" field should not contain "None"
    And the "Message from other users" field should not contain "None"
    And the "System message" field should not contain "None"
    # Verifying all options are selectable for the following user notifications
    And I select "Email" from "System message"
    And I select "Email digest" from "System message"
    And I select "Inbox" from "System message"
    And I select "Email" from "Message from other users"
    And I select "Email digest" from "Message from other users"
    And I select "Inbox" from "Message from other users"
    And I select "Email" from "Watchlist"
    And I select "Email digest" from "Watchlist"
    And I select "Inbox" from "Watchlist"
    And I select "None" from "Watchlist"
    And I select "Email" from "New page access"
    And I select "Email digest" from "New page access"
    And I select "Inbox" from "New page access"
    And I select "None" from "New page access"
    And I select "Email" from "Institution message"
    And I select "Email digest" from "Institution message"
    And I select "Inbox" from "Institution message"
    And I select "None" from "Institution message"
    And I select "Email" from "Group message"
    And I select "Email digest" from "Group message"
    And I select "Inbox" from "Group message"
    And I select "None" from "Group message"
    And I select "Email" from "Comment"
    And I select "Email digest" from "Comment"
    And I select "Inbox" from "Comment"
    And I select "None" from "Comment"
    And I select "Email" from "New forum post"
    And I select "Email digest" from "New forum post"
    And I select "Inbox" from "New forum post"
    And I select "None" from "New forum post"
    And I press "Save"
    And I should see "Preferences saved"

Scenario: Admin logs in and checks notification settings (Bug 1388682)
    Given I log in as "admin" with password "Kupuhipa1"
    And I choose "Site options" in "Configure site" from administration menu
    And I click on "Notification settings"
    #see the notification settings in alphabetical order.
    And "Comment" "text" should appear before "Contact us" "text"
    And "Contact us" "text" should appear before "Feedback on annotations" "text"
    And "Feedback on annotations" "text" should appear before "Group message" "text"
    And "Group message" "text" should appear before "Institution message" "text"
    And "Institution message" "text" should appear before "Message from other users" "text"
    And "Message from other users" "text" should appear before "New forum post" "text"
    And "New forum post" "text" should appear before "New page access" "text"
    And "New page access" "text" should appear before "Objectionable content" "text"
    And "Objectionable content" "text" should appear before "Objectionable content in forum" "text"
    And "Objectionable content in forum" "text" should appear before "Repeat virus upload" "text"
    And "Repeat virus upload" "text" should appear before "System message" "text"
    And "System message" "text" should appear before "Virus flag release" "text"
    And "Virus flag release" "text" should appear before "Wall post" "text"
    And "Wall post" "text" should appear before "Watchlist" "text"
