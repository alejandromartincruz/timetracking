class EntriesController < ApplicationController
	def index
		@project = Project.find_by(id: params[:project_id])
		if @project.nil?
			render template: "shared/error"
		else
			@entries = @project.entries
		end
	end

	def new
		@project = Project.find_by(id: params[:project_id])
		@entry = Entry.new
	end

	def create
		project_id = params[:project_id]
		project = Project.find_by(id: project_id)
		entry = project.entries.new({
			hours: params[:entry][:hours],
			minutes: params[:entry][:minutes],
			data: params[:entry][:data],
			comments: params[:entry][:comments]
			})
		entry.save
		redirect_to "/projects/#{project_id}/entries"
	end
end
