Given /^that I am a user$/ do
  @user = User.find('mnyon')
end

Given /^I am logged in$/ do  
  !@user.nil?
end

Given /^I am not logged in$/ do
  self.respond_to?(:session).should be_false
end

When /^I receive an authentication dialog$/ do  
  header('REMOTE_USER','workgroup\mnyon')
end

When /^I enter a username and password$/ do
  basic_auth 'workgroup\\mnyon', 'P@55word'  # express the regexp above with the code you wish you had
end

Then /^I should log onto the site$/ do  
  session[:current_user].should_not be_empty
end

When /^the user service is down$/ do
  User.stub!(:find).and_raise(ActiveResource::ServerError)    
  session.delete(:current_user)
end

