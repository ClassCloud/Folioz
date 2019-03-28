@javascript @core @core_user @core_portfolio @friends
Feature: Friends feature functionality
    1. UserA find people within and without their Institution
        a. Verify page elements
            - Search field
            - Side blocks
            - Results - User image, user name, institution member and action buttons (send friend request, send message)
    2. UserA request friendship - add message (make 4 friend requests)

Background:
    Given the following "institutions" exist:
    | name | displayname |
    | instone | Institution One |
    | insttwo | Institution Two |

    Given the following "users" exist:
    | username | password | email | firstname | lastname | institution | authname |role |
    | UserA | Kupuh1pa! | UserA@example.org  | Angela  | UserA | instone | internal | member |
    | UserB | Kupuh1pa! | UserB@example.org  | Bob     | UserB | instone | internal | member |
    | UserC | Kupuh1pa! | UserC@example.org  | Cecilia | UserC | instone | internal | member |
    | UserD | Kupuh1pa! | UserD@example.org  | Dave    | UserD | insttwo | internal | member |
    | UserE | Kupuh1pa! | UserE@example.org  | Earl    | UserE | insttwo | internal | member |

Scenario: UserA sends friend requests to UserB, UserC, User E
    Given I log in as "UserA" with password "Kupuh1pa!"
    And I choose "Find people" in "Engage" from main menu
    Then I should see "Bob UserB"
    And I should see "Cecilia UserC"
    And I should not see "Dave UserD"
    When I click on "Send friend request" in "Bob UserB" row
    Then I should see "Send Bob UserB a friendship request"
    When I fill in "Would you like to be my friend?" for "Message"
    And I press "Request friendship"
    Then I should see "Sent a friendship request to Bob UserB"
    When I click on "Send friend request" in "Cecilia UserC" row
    Then I should see "Send Cecilia UserC a friendship request"
    When I fill in "Would you like to be my friend Cecilia?" for "Message"
    And I press "Request friendship"
    Then I should see "Sent a friendship request to Cecilia UserC"
    When I select "Everyone" from "Filter"
    And I press "Search"
    And I click on "Send friend request" in "Dave UserD" row
    Then I should see "Send Dave UserD a friendship request"
    When I fill in "Would you like to be my friend Dave?" for "Message"
    And I press "Request friendship"
    Then I should see "Sent a friendship request to Dave UserD"

    # UserA sets Friends control so Nobody may add them as a friend
    Given I select the radio "Nobody may add me as a friend"
    And press "Save"
    Then I should see "Updated friends control"
    And I log out

    # User B accepts the friendship request
    Given I log in as "UserB" with password "Kupuh1pa!"
    When  I follow "pending friend"
    Then I should see "Angela UserA (UserA)"
    And I should see the date "today" in the "h3.card-header" element with the format "l, d F Y"
    And I should see "Member of Institution One"
    When I press "Approve request"
    Then I should see "Accepted friend request"
    And I log out
    Given I log in as "UserC" with password "Kupuh1pa!"
    When  I follow "pending friend"
    Then I should see "Angela UserA (UserA)"
    And I should see the date "today" in the "h3.card-header" element with the format "l, d F Y"
    And I should see "Member of Institution One"
    When I click on "Deny request"
    Then I should see "Reason for rejecting request"
    When I fill in "I don't know who you are" for "Reason for rejecting request"
    And I press "Deny friend request"
    Then I should see "Rejected friend request"
    Then I log out

# UserC logs in and tries to add UserA who has set their friends control to Nobody may add me as a friend
    Given I log in as "UserE" with password "Kupuh1pa!"
    And I choose "Find people" in "Engage" from main menu
    When I select "Everyone" from "Filter"
    And I press "Search"
    Then I should see "This user does not want any new friends." in the "Angela UserA" row
    And I click on "Send friend request" in "Dave UserD" row
