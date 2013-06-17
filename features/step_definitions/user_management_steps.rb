Given(/^I am a signed in user$/) do
  @user = create(:user, email: 'test_user@example.com', password: 'password')
  step "I sign in"
end

Given(/^I am a signed out user$/) do
  @user = create(:user, password: 'password')
end

When(/^I sign up$/) do
  visit new_user_path
  fill_in 'Email', with: 'test_user@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end

When(/^I sign in$/) do
  visit new_user_session_path
  fill_in 'user_email', with: 'test_user@example.com'
  fill_in 'user_password', with: 'password'
  click_button 'Sign in'
end

When(/^I sign out$/) do
  page.driver.submit :delete, destroy_user_session_path, {}
end

Then(/^I should be asked to sign up or sign in$/) do
  pending
end
