class Wine < ActiveRecord::Base
	has_many : log_entries, dependent :: destroy
	scope :bargains, -> {where('price < 15.00')}
	scope :by, ->(varietal)  {where('varietal = ?', varietal) }
	validates :name, :year, :winery, :country, :price :presence, true
numerically: { only_integer: true, greater_than_or_equal_to: 0}, unless: "year.blank?"
#should this be "year.blank" or 'year.blank'???
validates :year
numerically: {only_integer: true, greater_than_or_equal_to: 0}, unless: "year.blank?"
#should this be "year.blank" or 'year.blank'???
validates :price
numerically: { greater_than_or_equal_to: 0}, if: "price.present?"
#should this be "year.blank" or 'year.blank'???
#should comma fall after validates :year and then l11 :price?
	def average_stars
		reviews.average(:stars)
	end

	define average_ratings
	if log_entries.loaded?
		log_entries.map(&:rating).compact.average
	else
		log_entries.average(:rating)
	end
end
