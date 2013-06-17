When(/^I promote that idea$/) do
  step "I visit that idea's page"
  click_link "Promote"
end

Then(/^that idea should be a project$/) do
  @idea.reload
  @idea.should be_project
end

