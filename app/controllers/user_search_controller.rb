class UserSearchController < ApplicationController
  
	skip_before_filter :authorize
	skip_before_filter :administor
	skip_before_filter :correct_user

  	def search
  		$context = params[:user_search][:search_context].to_s
  		if $context.length == 0
  			flash[:error] = "Your search did not match any documents."
  			redirect_to users_path
  		else
  	#		@users_result = User.find(:all, :conditions => ["name like ?", "%"+params[:user_search][:search_context]+"%"])
  			@users_result = User.paginate :conditions => ["name like ? or email like ?", "%"+$context+"%", "%"+$context+"%"], page: params[:page], per_page: 5
 # 			flash[:success] = "About "+ pluralize(@users_result.count.to_s, "result")+"."
 			if @users_result.empty?
 				flash[:error] = "Your search did not match any documents."
 				redirect_to users_path and return 
 			end
    		respond_to do |format|
      			format.html # index.html.erb
      			format.json { render json: @users_result }
      		end
  		end
  	end

  	def show
  		if $context.length == 0
  			redirect_to users_path
  		else
  	#		@users_result = User.find(:all, :conditions => ["name like ?", "%"+params[:user_search][:search_context]+"%"])
  			@users_result = User.paginate :conditions => ["name like ? or email like ?", "%"+$context+"%", "%"+$context+"%"], page: params[:page], per_page: 5
  			if @users_result.empty
  				flash[:error] = "Your search did not match any documents."
 				redirect_to users_path and return 
  			end
    		respond_to do |format|
      			format.html # index.html.erb
      			format.json { render json: @users_result }
      		end
  		end
  	end

end
