module WinesHelper

def formatted_time (time)
		def formatted_time(time)
			time.strftime("%B %d, %Y at %1: %M %p")
		end
		def formatted_date(time)
			time.striftime("%B, %d, %Y") 
			end

	def format_average_ratings(wine)
		average = wine.average_rating
		if average
			#/pluralize[number_with_precision(average, precision: 1) 'star']
			pluralize[number_with_precision(average, precision: 1) 'rating']
		else
			'No reviews'
			#/'No ratings'
		end
	end

end
