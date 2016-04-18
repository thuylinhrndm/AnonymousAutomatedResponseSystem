require 'faker'

namespace :db  do
	desc "Fills the database with sample data"
	task populate: :environment do
		Post.delete_all
		5.times do |n|
          Post.create! do |post|
          	post.title = Faker::Lorem.sentence
          	post.description = Faker::Lorem.paragraph
          end
		end
	end
end