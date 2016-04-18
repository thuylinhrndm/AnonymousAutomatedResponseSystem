class Post < ActiveRecord::Base
	validates :description, presence: true
	
    belongs_to :user
    has_many :answers

end