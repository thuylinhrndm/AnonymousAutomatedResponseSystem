class Conversation < ActiveRecord::Base
  	#associations
  	belongs_to :user
  	belongs_to :consultant, class_name: "User"
  	has_many :chat_messages, dependent: :destroy
  	
  	#validations
  	validates_uniqueness_of :user_id, scope: :consultant_id
  	
end
