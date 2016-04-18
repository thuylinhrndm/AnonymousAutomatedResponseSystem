class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :answers
	has_many :appointments
	has_many :clients, class_name: "Appointment", foreign_key: "consultant_id" 
	has_many :conversations
	has_many :chat_messages

	ROLES = ["admin", "consultant", "user"]

	def self.create_with_omniauth(auth)
		create! do |user|
		user.provider = auth["provider"]
		user.uid = auth["uid"]
		user.name = auth["info"]["name"]
		user.email = auth["info"]["email"]
		end
	end
end
