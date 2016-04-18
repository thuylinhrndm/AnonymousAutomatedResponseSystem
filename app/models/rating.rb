class Rating < ActiveRecord::Base
    belongs_to :saved_link
    
    VALUES = [1, 2, 3, 4, 5]
end
