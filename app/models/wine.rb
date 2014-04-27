class Wine < ActiveRecord::Base
	VARIETALS = ["Cabernet", "Chardonnay", "Chianti", "Merlot", "Sparkling", "Rose", "Zinfandel" ]
	
	validates :name, :year, :winery, :country, :varietal, presence: true
	
	validates :varietal, :inclusion => { :in => VARIETALS}
	validates :year, numericality: { only_integer: true } 
end
