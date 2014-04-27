class Wine < ActiveRecord::Base
	VARIETALS = ["Cabernet", "Chardonnay", "Chianti", "Merlot", "Sparkling", "Rose", "Zinfandel" ]
	
	validates :name, :year, :country, :varietal, presence: true
	
	validates :varietal, :inclusion => { :in => VARIETALS}
	validates :year, numericality: { only_integer: true } 
end

	has_many :log_entries, dependent: :destroy

	def average_rating
		log_entries.average(:rating)
	end
end

