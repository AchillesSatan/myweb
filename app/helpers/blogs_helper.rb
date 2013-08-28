module BlogsHelper
	def find_author user_id
    	user = User.find(user_id)
    	user.name
	end

	def get_month month
		m = %w{ January February March April May June July August September October November December}
		m[month-1]
	end
end
