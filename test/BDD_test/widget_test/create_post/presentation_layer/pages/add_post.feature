Feature: Add Post
    Scenario: When i tap add post button
       Given The app is running
       When I tap {Icons.add} icon
       Then I navigated to {AddPost} page
       And I see {"Add Post"} text
       And I see {"Add Title"} textField
       And I see {"Submit"} button