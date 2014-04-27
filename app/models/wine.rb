class Wine < ActiveRecord::Base
	VARIETALS = ["Cabernet", "Chardonnay", "Chianti", "Merlot", "Sparkling", "Rose", "Zinfandel" ]
	
	validates :name, :year, :winery, :country, :varietal, presence: true
	
	validates :varietal, :inclusion => { :in => VARIETALS}
	validates :year, numericality: { only_integer: true } 
end

def average_rating
	if log_entries.loaded?
		log_entries.map(&:rating).compact.average
	else
		log_entries.average(:rating)
	end
end
end

