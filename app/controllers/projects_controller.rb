class ProjectsController < ApplicationController
	def index
		@projects = Project.all
		render :index
	end

	def show
		@id = params[:id]
		
		@project = Project.find_by(id: @id)
		#render template "no_project" if @project.nil?
		
		render :show
	end

	def new
		@project = Project.new
	end

	def create

		@project = Project.new(entry_params)
		#@project = Project.new({
		#	title:params[:project][:title],
		#	description:params[:project][:description],
		#	priority:params[:project][:priority]
		#	})
		if @project.save
			redirect_to "/projects"
		else
			render :new
		end
	end

	def edit
		@project = Project.find_by(id: params[:id])
	end

	def update
		@project = Project.find_by(id: params[:id])
		if @project.update(entry_params)
			redirect_to projects_path
		else
			render :edit
		end
	end

	def destroy
		project = Project.find_by(id: params[:id])
		project.destroy
		redirect_to projects_path
	end

	private
	def entry_params
		params.require(:project).permit(:title, :description, :priority)
	end
end
