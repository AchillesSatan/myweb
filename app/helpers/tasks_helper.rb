module TasksHelper
	def is_empty? m
		if m.nil?
			"----"
		else
			m
		end
	end

	def is_project_empty? m
		if m.nil?
			"----"
		else
			m.name
		end
	end

	def is_date_empty? m
		if m.nil?
			"----"
		else
			m.strftime('%Y-%m-%d %H:%M:%S').to_s
		end
	end
end
