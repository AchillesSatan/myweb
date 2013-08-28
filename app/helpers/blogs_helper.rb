module BlogsHelper
	def find_author user_id
    	user = User.find(user_id)
    	user.name
	end
end
