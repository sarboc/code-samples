Feature: Infographics
  So that I can distinguish between different images

  Scenario: marketing content editor CRUDS image type
    Given I am logged in as "film_content_editor"
    And I go to the admin image types page
    And I follow "Add new type"
    When I press "Save"
    Then I should see "Name can't be blank"

    When I fill out the image type form
    And I press "Save"
    Then I should see the image type

    When I edit that image type with bad data
    Then I should see "Name can't be blank"
    And I should see "Edit the image type"

    When I fill out the image type form
    And I press "Save"
    Then I should see the image type

    When I delete the image type
    Then I should not see the image type

  Scenario: user tries to delete an image type that has images associated with it
    Given There is an image type with an associated image
    And I am logged in as "film_content_editor"
    And I am on the admin image types page
    When I delete the image type
    Then I should see "That type has images associated with it and cannot be destroyed"
    And I should see the image type


