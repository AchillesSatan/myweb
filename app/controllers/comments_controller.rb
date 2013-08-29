class CommentsController < ApplicationController
	skip_before_filter :authorize
  	skip_before_filter :administor
  	skip_before_filter :correct_user
	def create
		@user = User.find_by_email(session[:user_email])
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.create(params[:comment])
		@comment.user = @user
		@comment.save
		redirect_to blog_path(@blog)
	end

	def destroy
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.find(params[:id])
		@comment.destroy
		redirect_to blog_path(@blog)
	end
end
