Feature: Load Posts
    Scenario: Load all posts
        Given The app is running
        Then I see Header Title key
        And I see Bloc Provider
        And I see Bloc Builder
        Then I should see ListView
        And I see {Icons.add} icon
