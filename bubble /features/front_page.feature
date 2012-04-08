Feature: Front Page
    In order to see the most relevant posts
    As a reader
    I want the most 10 recent posts on the front page
    
    Scenario: 1 post in tee
    Given I have a post
    And my post has title "My post"
    And my post has body "Ini tees aku design"
    And my post has author with name "iqbal"
    And my post was published on "May 22, 2010"
    And my post will not be published 
    When I go to the homepage
    Then I should see "<h2>MY Post</h2>
    And I should see "Ini tees aku design"
    And I should see "iqbal"
    And I should see "May 22, 2010"
