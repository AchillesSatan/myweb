module UsersHelper
	
	# Returns the Gravatar (http://gravatar.com/) for the given user.


  	def gravatar_for(user, options = { size: 70 })
    	gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    	size = options[:size]
    	gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    	image_tag(gravatar_url, alt: user.name, class: "gravatar")
  	end


	def get_gravatar(user_id, options = { size: 70 })
		user=User.find(user_id)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    	size = options[:size]
    	gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    	image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
end
