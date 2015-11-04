class ProjectsController < ApplicationController
	def index
		@projects = Project.all
		render :index
	end

	def show
		@id = params[:project_id].to_i
		
		@project = Project.find_by(id = @id)
		#render template "no_project" if @project.nil?
		
		render :show
	end

	def new
		@project = Project.new
	end

	def create
		Project.create({
			title:params[:project][:title],
			description:params[:project][:description],
			priority:params[:project][:priority]
			})
		redirect_to "/projects"
	end
end
