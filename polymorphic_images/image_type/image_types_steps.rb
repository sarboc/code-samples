When(/^I fill out the image type form$/) do
  @image_type ||= build :image_type
  fill_in "Name", with: @image_type.name
end

Then(/^I should see the image type$/) do
  page.should have_content(@image_type.name)
end

When(/^I edit that image type with bad data$/) do
  @image_type.name = "other_name"
  step %Q(I follow the first "Edit")
  fill_in "Name", with: ""
  click_button "Save"
end

When(/^I delete the image type$/) do
  step %Q(I follow the first "Delete")
end

Then(/^I should not see the image type$/) do
  page.should_not have_content(@image_type.name)
end

Given(/^There is an image type with an associated image$/) do
  @image_type = create :image_type
  @image = create :image, image_type: @image_type
end

