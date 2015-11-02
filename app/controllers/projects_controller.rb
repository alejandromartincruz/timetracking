class ProjectsController < ApplicationController
	def index
		@projects = Project.all
		render :index
	end

	def show
		@id = params[:project_id].to_i
		
			@project = Project.find_by(id = @id)
		
		render :show
	end
end
