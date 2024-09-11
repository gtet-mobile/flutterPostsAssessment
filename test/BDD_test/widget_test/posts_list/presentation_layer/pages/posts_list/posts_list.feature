Feature: PostsList
    Scenario: Have add post button
       Given The app is running
       When I see Header Title
       Then I see ListView
       Then I see {Icons.add} icon
