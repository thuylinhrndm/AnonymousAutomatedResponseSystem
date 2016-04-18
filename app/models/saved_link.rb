class SavedLink < ActiveRecord::Base
    has_many :ratings
    
    def sum_of_ratings
        ratings.pluck(:rating).inject(0) {|sum, number| sum += number}
    end
    
    def average_rating
        sum_of_ratings/ratings.count.to_d
    end
end
