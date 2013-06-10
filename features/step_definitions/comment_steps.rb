Given(/^that idea has a comment$/) do
  @comment = create(:comment, idea: @idea)
end

When(/^I add a comment to that idea$/) do
  @comment_text = Faker::Lorem.paragraph
  visit idea_path(@idea)
  fill_in 'comment[text]', with: @comment_text
  click_button "Comment"
end

Then(/^I should see the comment$/) do
  @comment.try(:reload)
  @comment_text ||= @comment.text
  page.should have_content @comment_text
end
