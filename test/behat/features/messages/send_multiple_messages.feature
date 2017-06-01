@javascript @core @core_messages @core_group @core_account
Feature: Send messages to other users
   In order to send a message to another user
   As an admin I need to create an user
   So I can send it messages

Background:
Given the following "users" exist:
     | username | password | email | firstname | lastname | institution | authname | role |
     | Bob | Kupuhipa1 | test01@example.com | Bob | Mc Bobby | mahara | internal | member |
     | userA | Kupuhipa1 | test02@example.com | Pete | Mc | mahara | internal | member |

Scenario: Sending messages between user and admin (Bug 1426983)
   # Log in as "Admin" user
   Given I log in as "admin" with password "Kupuhipa1"
   # Verifying log in was successful
   And I should see "Admin User"
   # Sending message 1
   And I choose "Find people" in "Groups" from main menu
   And I follow "Bob"
   And I follow "Send message"
   And I fill in the following:
   | Subject   | Hi there |
   | Message   | This is a test message   |
   And I press "Send message"
   # Sending message 2
   And I choose "Find people" in "Groups" from main menu
   And I follow "Bob"
   And I follow "Send message"
   And I fill in the following:
   | Subject   | Hi there2 |
   | Message   | This is a test message2   |
   And I press "Send message"
   # Sending message 3
   And I choose "Find people" in "Groups" from main menu
   And I follow "Bob"
   And I follow "Send message"
   And I fill in the following:
   | Subject   | Hi there3 |
   | Message   | This is a test message3   |
   And I press "Send message"
   And I choose "Find people" in "Groups" from main menu
   And I follow "Bob"
   And I follow "Request friendship"
   #Sending a friend request with more than 255 characters (Bug 1373670)
   And I fill in the following:
   | Message   | I shot an arrow into the air, it fell to earth, I knew not where; For, so swiftly it flew, the sight could not follow it in its flight. Long, long afterward, in an oak I found the arrow, still unbroke; And the song, from beginning to end, I found again in the heart of a friend. |
   Then I should see "This field must be at most 255 characters long"
   And I fill in the following:
   | Message   | Written with a pen, sealed with a kiss, if you are my friend, please answer me this |
   And I press "Request friendship"
   # Log out as "Admin" user
   And I log out
   # Log in as user 1
   Then I log in as "Bob" with password "Kupuhipa1"
   # Confirming all messages has been received
   And I am on homepage
   And I should see "Hi there"
   And I choose "mail" from user menu by id
   And I should see "Hi there"
   And I should see "Hi there2"
   And I should see "Hi there3"
   And I should not see "Call stack"
   # Log out as Bob
   And I log out
   #Sending friend requests from student to admin (Bug 1440908)
   Then I log in as "admin" with password "Kupuhipa1"
   And I choose "User search" in "Users" from administration menu
   And I follow "Pete"
   And I follow "Log in as userA"
   And I follow "Admin User"
   And I follow "Request friendship"
   And I fill in "Would you like to be my friend?" for "Message"
   And I press "Request friendship"
   And I follow "Become Admin User again"
   And I am on homepage
   # In my inbox block I'll see "New friend request"
   And I choose "mail" from user menu by id
   And I expand the section "New friend request"
   # Clicking on the notification title to expand it
   And I follow "Requests"
   And I should see "Would you like to be my friend?"
   And I press "Approve request"
   And I should see "Accepted friend request"
   And I follow "Log in as userA"
   # In userA's inbox block I'll see a "Friend request accepted" notification
   And I choose "mail" from user menu by id
   And I expand the section "Friend request accepted"
   # Expanding it shows me another "More..." link which takes me to the inbox
   And I follow "More..."
   And I should not see "Not Found"
   And I should see "Remove from friends"
   And I should see "Admin User's wall"
