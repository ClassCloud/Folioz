@javascript @core @core_administration
Feature: Configuring the site options page
In order to change the configuration settings on the site options page
As an admin
So I can configure the site to the way the client wants

Scenario: Turning the switches on and off on the Site Options page (Bug 1431569)
 Given I log in as "admin" with password "Kupuhipa1"
 And I choose "Site options" in "Configure site" from administration menu
 # Verifying I'm on the right page
 And I should see "Here you can set some global options that will apply by default throughout the entire site."
 And I expand all fieldsets
 # Changing all the switches from their default settings
 And I set the following fields to these values:
| Show homepage / dashboard information | 0 |
| Send weekly updates? | 1 |
| Users can choose page themes | 1 |
| Display remote avatars | 1 |
| Users can hide real names | 1 |
| Never display usernames | 1 |
| Show users in public search | 1 |
| Anonymous comments | 0 |
| Access reports for staff | 1 |
| All reports for institution staff | 1 |
| Users can disable device detection | 1 |
| Require reason for masquerading | 1 |
| Notify users of masquerading | 1 |
| Show profile completion | 1 |
| Export to queue | 1 |
| Multiple journals | 1 |
| Allow group categories | 1 |
| Confirm registration | 1 |
| Users allowed multiple institutions | 0 |
| Auto-suspend expired institutions | 1 |
| Virus checking | 1 |
| Spamhaus URL blacklist | 1 |
| SURBL URL blacklist | 1 |
| Disable external resources in user HTML | 1 |
| reCAPTCHA on user registration form | 1 |
| Allow public pages | 0 |
| Allow public profiles | 0 |
| Allow anonymous pages | 1 |
| Sitemap | 0 |
| Portfolio search | 1 |
| Tag cloud | 0 |
| Maximum tags in cloud | 20 |
| Show online users | 0 |
| Registration agreement | 1 |
| License metadata | 1 |
| Custom licenses | 1 |
And I press "Update site options"

Scenario: Setting default account lifetime
 Given I log in as "admin" with password "Kupuhipa1"
 And I choose "Site options" in "Configure site" from administration menu
 And I expand all fieldsets
 And I select "Weeks" from "siteoptions_defaultaccountlifetime_units"
 And I fill in "10" for "siteoptions_defaultaccountlifetime"
 And I press "Update site options"
