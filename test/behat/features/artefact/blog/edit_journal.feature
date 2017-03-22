@javascript @core @core_artefact
Feature: Editing my journal
In order to edit my journal
As an user
I need to create a journal

Background:
Given the following "users" exist:
 | username | password | email | firstname | lastname | institution | authname | role |
 | userA | Kupuhipa1 | test01@example.com | Pete | Mc | mahara | internal | member |


Scenario: Creating a journal and editing it (Bug 1513716)
Given I log in as "userA" with password "Kupuhipa1"
# Creating a journal
And I choose "Journals" in "Content" from Main menu
And I should see "Journals"
When I click on "New entry"
And I set the following fields to these values:
 | Title | My new journal |
 | Entry | blog |
And I press "Save entry"
Then I should see "Journal entry saved"
# Editing the Journal
And I click on "Edit" in "My new journal" row
And I set the following fields to these values:
 | Title | My new journal |
 | Entry | Jinelle was here Nov 2015 |
 And I press "Save entry"

 And I should see "Jinelle was here Nov 2015"
 And I should see "Last updated:"
