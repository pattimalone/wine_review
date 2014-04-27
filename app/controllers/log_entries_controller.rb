class LogEntriesController < ApplicationController
  	before_action :set_wine

  	def index
 		@log_entries = @wine.log_entries.order('created_at desc')
  	end

  	def show
	
  end

	def new
		@log_entry = @wine.log_entries.new
	end

	def create 
		@log_entry = @wine.log_entries.new (log_entry_params)
		if @log_entry.save
		redirect_to_wine_log_entries_path(@wine),  notice: 'Log Entry saved!'
	else
		render :new
	end
end


	def set_wine
		@wine = Wine.find(params[:id])
	end
	

	private

	def log_entry_params
		params.require(:log_entry).permit(:name, :rating, :location, :comments, :tasted_on)
end
end

