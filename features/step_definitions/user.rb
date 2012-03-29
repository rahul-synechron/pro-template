Given /^a user visits the signin page$/ do
   visit('/users/sign_in') # ensure that at least
end

When /^he submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^he should see an error message$/ do
  page.should have_selector('#user_new')
end

Given /^the user has an account$/ do
   @user = User.create(name: "rahul", email: "rahul@gmail.com",
                      password: "test123", password_confirmation: "test123")
end

Given /^the user submits valid signin information$/ do
  visit ('/users/sign_in')
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password 
  click_button "Sign in"
end


Then /^he should see his profile page$/ do
  page.should have_selector('title', text: @user.name)
end


Then /^he should see a signout link$/ do
  page.should have_link('Sign out', href: destroy_user_session_path)
end
