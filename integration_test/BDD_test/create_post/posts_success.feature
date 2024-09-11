Feature: PostsList
    Scenario: Checking Post Feature SuccessFlow
       Given The app is running
       Then I see {Icons.add} icon
       Then I tap {Icons.add} icon
       Then I navigated to {AddPost} page
       And I see {"Add Post"} text
       And I see {"Add Title"} title textField
       And I tap {"Add Title"} title textField
       And I see {"SubTitle"} subtitle textField
       And I tap {"SubTitle"} subtitle textField
       And I see {"Select a UserId"} dropDown
       And I tap {"Select a UserId"} dropDown
       And I see {"Submit"} button
       And I tap {"Submit"} button
