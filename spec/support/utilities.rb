include ApplicationHelper

def valid_signin(user)
	fill_in "Email",	with: user.email
	fill_in "Password",	with: user.password
	click_button "Sign in"
end

# helper method to decouple the test from the site's implementation
# so if the css changed, this is the only place the test code needs to change
RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: message)
	end
end