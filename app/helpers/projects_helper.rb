module ProjectsHelper
	def find_tasks_of_project project_id
		 tasks = Task.where("project_id=?", project_id).order("end asc")
	end
end
