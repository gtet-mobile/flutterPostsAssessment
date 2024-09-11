Feature: Post Detail
    Scenario: Post Detail Alert
       Given The app is running
       When I see ListView
       Then I see first List Item
       And I tap on first List Item
       And I see post detail AlertView
       And I see post detail Id
       And I see post detail Title
       And I see post detail Body