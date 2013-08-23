module SessionsHelper

	def signed_in?
		!session[:user_email].nil?
	end

	def adminitted?
		@current_user = User.find_by_email(session[:user_email])
		@current_user.auth
	end

	def current_user
    	@current_user = User.find_by_email(session[:user_email])
  	end

  	def redirect_back_or(default)
    	redirect_to(session[:return_to] || default)
    	session.delete(:return_to)
  	end

    def store_location
    	session[:return_to] = request.fullpath
  	end

end
