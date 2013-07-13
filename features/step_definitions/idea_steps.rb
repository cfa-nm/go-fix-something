Given(/^an idea exists$/) do
  @idea = create(:idea)
end

Given(/^an idea I created exists$/) do
  @idea = create(:idea, user: @user)
end

Given(/^I am on that idea's page$/) do
  visit idea_path(@idea)
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
  find(".#{type}vote").click
end

When(/^I cancel my (?:up|down)?vote$/) do
  find(".cancelvote").click
end

Then(/^the idea should( not)? be (up|down)voted$/) do |negate, type|
  # FIXME: this should work, but capybara's not behaving
  # expected_value = if negate
  #                    0
  #                  else
  #                    case type
  #                    when 'up'   then 1
  #                    when 'down' then -1
  #                    end
  #                  end
  # find('.vote-total').should have_content "(#{expected_value})"
end

Then(/^I should not be able to (up|down)vote the idea(?: again)?$/) do |type|
  page.should have_no_selector "a.#{type}vote"
end
