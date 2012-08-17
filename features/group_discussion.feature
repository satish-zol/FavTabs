Feature: Group in Process
   In order to test all Group functionality
   as an user
   I want various following scenarios.

   @javascript
   Scenario: See the Group link in top menu
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I wait 2 seconds
    And I go to the my account page
    Then I should see "Groups"

   @javascript
   Scenario: See Create group link on groups page
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I go to the my account page
    Then I should see "Groups"
    When I follow "Groups"
    And I wait 2 seconds
    And I should see "Create Group"
    

   @javascript
   Scenario: See create Group functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I go to the my account page
    Then I should see "Groups"
    When I follow "Groups"
    And I should see "My Groups"
    And I should see "Create Group"
    And I wait 1 seconds
    When I follow "Create Group"
    And I wait 1 seconds
    And I should see "Name:"
    And I should see "Description:"
    And I should see "Public"
    And I should see "Private"
    And I should see "Create" button
    And I wait 1 seconds

   @javascript
   Scenario: See Group validation functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I go to the my account page
    Then I should see "Groups"
    When I follow "Groups"
    And I should see "Create Group"
    And I wait 1 seconds
    When I follow "Create Group"
    And I should see "Create Group"
    When I follow "Create Group"
    And I should see "Name:"
    And I should see "Description:"
    And I should see "Public"
    And I should see "Private"
    And I wait 1 seconds
    When I fill in the following:
     | discussion_group_name |  |
     | discussion_group_description | This is Test group description |
    Then I choose "private"
    And I press "Create"
    And I wait 1 seconds
    Then I should see "Name can't be blank."
    When I fill in the following:
     | discussion_group_name | xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx |
     | discussion_group_description | This is Test group description |
    Then I choose "public"
    And I press "Create"
    And I wait 1 seconds
    Then I should see "Name can't be of more than 20 characters."
    And I wait 1 seconds
    When I fill in the following:
     | discussion_group_name | My Group |
     | discussion_group_description | TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT |
    Then I choose "public"
    And I press "Create"
    And I wait 1 seconds
    Then I should see "Description can't be of more than 1000 characters."
    And I wait 1 seconds
    When I fill in the following:
     | discussion_group_name | My Group |
     | discussion_group_description | This is Test group description |
    Then I choose "public"
    And I press "Create"
    And I wait 1 seconds
    Then I should see "Group created successfully."
    And I should see "My Groups"
    And I wait 2 seconds
 
   @javascript
   Scenario: See group delete functionality
    Given I am on the home page
     And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
     And I have group user_id 2 and name "Colleague" and description "Colleague Group" and is_public 0
     When I press "Sign In"
     And I go to the my account page
     Then I should see "Groups"
     When I follow "Groups"
     And I should see "My Groups"
     Then I should see "Colleague"
     And I wait 1 seconds
     When I hover over "Colleague"
     And I wait 1 seconds
     And I should see "Edit"
     And I should see the image title "Remove"
     When I follow "remove_group"
     And I wait 1 seconds
     And I accept confirm popup
     And I should see "There are no groups available for you."
     And I wait 1 seconds

   @javascript
   Scenario: See group rename functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I have group user_id 2 and name "Friends" and description "hi this group is only for friends" and is_public 0
    And I go to the my account page
    Then I should see "Groups"
    When I follow "Groups"
    And I should see "My Groups"
    Then I should see "Friends"
    When I hover over "Friends"
    And I wait 1 seconds
    And I should see "Edit"
    When I follow "Edit"
    Then I should see "Name:"
    Then I should see "Description:"
    And I should see "Public"
    And I should see "Private"
    And I should see "Update" button
    And I wait 1 seconds
    When I fill in the following:
     | edit_discussion_group_name | Best Friends group |
     | edit_discussion_group_description | This is Best Friend group description |
    Then I choose "private"
    And I press "Update"
    And I wait 1 seconds
    Then I should see "Group updated successfully."
    And I should see "Best Friends group"
    And I wait 1 seconds

    @javascript
    Scenario: See the functionality of find public groups and joined public groups
     Given I am on the home page
     And I have logged in as user with named "satish" and email "satish.zol@cipher-tech.com" and password "satish"
     When I press "Sign In"
     And I have public groups user_id 3 and name "Friends" and description "Friends Group" and is_public 1
     And I have public groups user_id 4 and name "college friends" and description "Collegian friends group" and is_public 1
     And I go to the my account page
     Then I should see "Groups"
     When I follow "Groups"
     Then I should see "My Groups"
     And I should see "Search public albums"
     And I should see "Search" button
     When I fill in the following:
      |search_group_text|Friends|
     And I press "Search"
     Then I should see "Search Result for 'Friends'"
     And I should see "Friends"
     And I should see "Join Group"
     When I follow "Join Group"
     Then I join public groups 
     Then I should see "Leave Group"
     And I wait 3 seconds

    @javascript
    Scenario: See the functionality to leave the joined public groups
     Given I am on the home page
     And I have logged in as user with named "satish" and email "satish.zol@cipher-tech.com" and password "satish"
     When I press "Sign In"
     And I have public groups user_id 3 and name "Friends" and description "Friends Group" and is_public 1
     And I have public groups user_id 4 and name "college friends" and description "Collegian friends group" and is_public 1
     And I go to the my account page
     Then I should see "Groups"
     When I follow "Groups"
     Then I should see "My Groups"
     And I should see "Search public albums"
     And I should see "Search" button
     When I fill in the following:
      |search_group_text|Friends|
     And I press "Search"
     Then I should see "Search Result for 'Friends'"
     And I should see "Friends"
     And I should see "Join Group"
     When I follow "Join Group"
     Then I join public groups
     Then I should see "Leave Group"
     When I follow "Leave Group"
     Then I leave public groups is_member 1
     And I should see "Join Group"
     And I wait 3 seconds

   @javascript
   Scenario: See leave group on groups page functionality
    Given I am on the home page
     And I have logged in as user with named "satish" and email "satish.zol@cipher-tech.com" and password "satish"
     And I have user named "jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "jalendra" and system_role 10
     And I have public groups for joining user_id 3 and name "CollegeFriends" and description "For College Friends" and is_public 1
     When I press "Sign In"
     And I go to the my account page
     Then I should see "Groups"
     When I follow "Groups"
     Then I should see "My Groups"
     And I should see "Search public albums"
     And I should see "Search" button
     When I fill in the following:
      |search_group_text|Friends|
     And I press "Search"
     Then I should see "Search Result for 'Friends'"
     And I should see "Friends"
     And I should see "Join Group"
     When I follow "Join Group"
     Then I join public groups 
     And I wait 1 seconds
     Then I should see "Groups"
     When I follow "Groups"
     Then I should see "My Groups"
     And I should see "CollegeFriends"
     And I wait 1 seconds
     When I hover over "CollegeFriends"
     And I wait 1 seconds
     And I should see "Leave Group"
     When I follow "Leave Group"
     And I wait 1 seconds
     And I accept confirm popup
     And I wait 1 seconds
     And I should not see "CollegeFriends"
     And I wait 1 seconds

    @javascript
    Scenario: See the functionality of Add Users to private group
    Given I am on the home page
     And I have logged in as user with named "satish" and email "satish.zol@cipher-tech.com" and password "satish"
     When I press "Sign In"
     And I have group user_id 2 and name "Friends" and description "hi this group is only for friends" and is_public 0
     And I go to the my account page
     Then I should see "Groups"
     When I follow "Groups"
     Then I should see "Friends"
     When I follow "Friends"
     Then I should see "Back To Groups"
     Then I should see "Add Users"
     And I should see "Invite Users"
     When I follow "Add Users"
     Then I should see "Add Email"
     And I should see "Email:"
     And I should see "private_group_user_email"
     And I should see "Add" button
     When I fill in the following:
       |add_user_to_groups[email]|asdfs|
     And I press "Add"
     Then I should see "Please enter valid email"
     And I wait 1 seconds
     When I fill in the following:
       |add_user_to_groups[email]|abcd@xyz.com|
     And I press "Add"
     Then I should see "Invitation successfully sent."
     And I wait 1 seconds

     @javascript
     Scenario: see the functionality of Invite Users by email to Private group
     Given I am on the home page
      And I have logged in as user with named "satish" and email "satish.zol@cipher-tech.com" and password "satish"
      When I press "Sign In"
      And I have group user_id 2 and name "Friends" and description "hi this group is only for friends" and is_public 0
      And I go to the my account page
      Then I should see "Groups"
      When I follow "Groups"
      Then I should see "Friends"
      When I follow "Friends"
      And I should see "Invite Users"
      When I follow "Invite Users"
      Then I should see "Invite User"
      And I should see "Email"
      And I should see "Username"
      And I should see "Group"
      And I should see "invite_group_user_email"
      And I should see "invite_group_user_username"
      And I should see "invite_group_user_groups"
      And I should see "Send" button
      When I choose "invite_by_email"
      When I fill in the following:
        |invite_user_to_groups[email]| |
      And I press "Send"
      Then I should see "Please enter email"
      And I wait 1 seconds
      When I fill in the following:
        |invite_user_to_groups[email]| saersa |
      And I press "Send"
      Then I should see "Please enter valid email"
      And I wait 1 seconds
      When I fill in the following:
        |invite_user_to_groups[email]| jalendra.bhanarkar@cipher-tech.com |
      And I press "Send"
      Then I should see "Invitation successfully sent."
      And I wait 1 seconds

     @javascript
     Scenario: see the functionality of Invite Users by email to Private group
     Given I am on the home page
      And I have logged in as user with named "satish" and email "satish.zol@cipher-tech.com" and password "satish"
      When I press "Sign In"
      And I have group user_id 2 and name "Friends" and description "hi this group is only for friends" and is_public 0
      And I go to the my account page
      Then I should see "Groups"
      When I follow "Groups"
      Then I should see "Friends"
      When I follow "Friends"
      And I should see "Invite Users"
      When I follow "Invite Users"
      Then I should see "Invite User"
      And I should see "Email"
      And I should see "Username"
      And I should see "Group"
      And I should see "invite_group_user_email"
      And I should see "invite_group_user_username"
      And I should see "invite_group_user_groups"
      And I should see "Send" button
      When I choose "invite_by_email"
      When I fill in the following:
        |invite_user_to_groups[email]| |
      And I press "Send"
      Then I should see "Please enter email"
      And I wait 1 seconds
      When I fill in the following:
        |invite_user_to_groups[email]| saersa |
      And I press "Send"
      Then I should see "Please enter valid email"
      And I wait 1 seconds
      When I fill in the following:
        |invite_user_to_groups[email]| jalendra.bhanarkar@cipher-tech.com |
      And I press "Send"
      Then I should see "Invitation successfully sent."
      And I wait 1 seconds

Background:
    Given the following username exists:
      | id  | username  |
      | 1   | Sat |
      | 2   | Jal |
      | 3   | Sal |
      | 4   | Trup |

  @javascript
  Scenario: Autocomplete username functionality
    Given I go to the home page
    And I fill in "Brand name" with "al"
    And I choose "Alpha" in the autocomplete list
    Then the "Brand name" field should contain "Alpha"