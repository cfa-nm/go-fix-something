Given(/^an idea exists$/) do
  @idea = create(:idea)
end

Given(/^an idea I created exists$/) do
  @idea = create(:idea, user: @user)
end

When(/^I try to create an idea$/) do
  visit root_path
  within('#new_idea') do
    fill_in 'idea[text]', with: Faker::Lorem.paragraph
    click_button 'Okay then'
  end
end

Then(/^my idea should be in the system$/) do
  Idea.count.should_not be 0
end

When(/^I visit that idea's page$/) do
  visit idea_path(@idea)
end

When(/^I (up|down)vote that idea$/) do |type|
  visit idea_path(@idea)
  find(".#{type}vote").click
end

When(/^I cancel my (?:up|down)?vote$/) do
  visit idea_path(@idea)
  find(".cancelvote").click
end

Then(/^the idea should( not)? be (up|down)voted$/) do |negate, type|
  @idea.reload
  expected_value = case type
                   when 'up'   then 1
                   when 'down' then -1
                   end
  @idea.vote_total.send(negate ? :should_not : :should) == expected_value
end

Then(/^I should not be able to (up|down)vote the idea(?: again)?$/) do |type|
  page.should have_no_selector "a.#{type}vote"
end
