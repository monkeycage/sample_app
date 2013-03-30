class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user #defined in sessions_helper.rb
			redirect_to user
			# Sign in the user and redirect to show page
		else
			#flash.now prevents the error message from displaying on any other page
			#apart from the one that is throwing the error. Otherwise, after you click
			#on to another page, the error message appears there as well.
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out #defined in sessions_helper.rb
		redirect_to root_url
	end

end
