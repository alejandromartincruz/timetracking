class EntriesController < ApplicationController
	def index
		@project = Project.find_by(id: params[:project_id])
		if @project.nil?
			render template: "shared/error"
		else
			@entries = @project.entries
		end
	end
end
