class WinesController < ApplicationController

		before_filter :check_for_cancel, :only => [:create, :edit]


 		before_action :set_wine_param, only: [ :show, :edit, :update, :destroy ]

  	def index
  		@available_at = Time.now
		@wines = Wine.order(:name).page(params[:page])
		#flash[:notice] = "Today's special is buy 1 - drink 1"
	end

	def show

  	end

	def new
		@wine = Wine.new
	end

	def create 
			@wine = Wine.new(wine_params)
			if @wine.save
				redirect_to @wine, notice: "#{@wine.name} was created"
			else 
				render :new
		end
	end

	def edit 

	end
	
	def update
			if @wine.update(wine_params)
				redirect_to @wine, notice: "#{@wine.name} was updated"
			else
				render :new
		end
	end
	
	def destroy
			@wine.destroy
			redirect_to wines_url
	end
	
	def check_for_cancel
		fp = File.open("hh_debug.out", "w")
		fp.puts "in check_for_cancel"
		xx = params[:commit]
		fp.puts " param is #{xx}"
		fp.close
		if params[:commit] == "Cancel"
			redirect_to wines_path
		end
	end

		


	def post
	end

private

	def wine_params
			params.require(:wine).permit( :name, :year, :winery, :country, :varietal)
	end
	
	def set_wine_param
			@wine = Wine.find(params[:id])
	end


end

