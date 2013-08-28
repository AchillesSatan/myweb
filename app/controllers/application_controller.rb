class ApplicationController < ActionController::Base

  	before_filter :authorize
  	before_filter :administor
  	before_filter :correct_user

  	protect_from_forgery

  	include SessionsHelper

  	protected

    def authorize
      	unless User.find_by_email(session[:user_email])
      		store_location
        	redirect_to signin_url, notice: "Please sign in!"
      	end
    end

    def administor
    	@user = User.find_by_email(session[:user_email])
    	unless @user.auth
    		redirect_to @user, notice: "You do not have the authority!" 
    	end
    end

    def correct_user
 		@user = User.find_by_email(session[:user_email])
    	if (!@user.auth) && (@user.id.to_s!=params[:id])
    		redirect_to @user, notice: "You do not have the authority!" 
    	end
    end



end
