require 'data'
class Result
	attr_accessor :title, :link_url, :click_count, :average_rating, :number_of_ratings

	def initialize(title, link_url, click_count = 0, average_rating = 0, number_of_ratings = 0)
		@title = title
		@link_url = link_url
		@click_count = click_count
		@average_rating = average_rating
		@number_of_ratings = number_of_ratings
	end
end