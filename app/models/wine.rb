class Wine < ActiveRecord::Base
	validates :name, :year, :winery, :country, :varietal, :price, presence: true
	validates :year,
		numericality: { only_integer: true, greater_than_or_equal_to: 0 }, 
		unless: "year.blank?"
	validates :price,
		numericality: { greater_than_or_equal_to: 0},
		if: "price.present?"
end
