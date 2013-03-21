FactoryGirl.define do

	factory :user do ##tell factory girl the definition is for a user object
		name					"Hetal Shah"
		email					"hetal@shah.com"
		password				"foobar1"
		password_confirmation	"foobar1"
	end

end