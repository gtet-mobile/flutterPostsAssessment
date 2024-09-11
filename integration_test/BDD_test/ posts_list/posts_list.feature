Feature: Load Posts
    Scenario: Load all posts
        Given The app is running
        Then I see Header Title key
        And I see {Icons.add} icon
        And I see Loader
        Then I should see ListView
        And I refresh the List View
        Then I should see Refreshed ListView
