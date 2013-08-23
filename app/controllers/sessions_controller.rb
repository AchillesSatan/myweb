class SessionsController < ApplicationController

	skip_before_filter :authorize
	skip_before_filter :administor
	skip_before_filter :correct_user

  	def new
  		render 'new'
  	end

  	def create
  		user = User.find_by_email(params[:session][:email].downcase)
  		if user && user.authenticate(params[:session][:password])
    		# Sign the user in and redirect to the user's show page.
    		session[:user_email] = user.email
    		flash[:success] = "Welcome to the Sample App!"
    		redirect_back_or user
      		#redirect_to user
  		else
    		# Create an error message and re-render the signin form.
    		flash.now[:error] = 'Invalid email/password combination'
      		render 'new'
  		end
  	end

  	def destroy
  		session[:user_email] = nil;
  		flash.now[:error] = 'You have signed out'
  		render 'new'
  	end
end
