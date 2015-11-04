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
		@project = Project.find_by(id: project_id)
		@entry = @project.entries.new(entry_params)

		#@entry = @project.entries.new({     	#todo esto se puede sustituir por la linea 
		#	hours: params[:entry][:hours],		#de arriba son equivalentes.
		#	minutes: params[:entry][:minutes],
		#	data: params[:entry][:data],
		#	comments: params[:entry][:comments]
		#	})

		if @entry.save
			redirect_to "/projects/#{@project.id}/entries"
		else
			render 'new'
		end
	end

	def edit
		@entry = Entry.find_by(id: params[:id])
	end

	def update
		@entry = Entry.find_by(id: params[:id])
		if @entry.update(entry_params)
			redirect_to project_entries_path(@entry.project.id)
		else
			render "edit"
		end
	end

	private
	def entry_params
		params.require(:entry).permit(:hours, :minutes, :data, :comments)
	end
end
