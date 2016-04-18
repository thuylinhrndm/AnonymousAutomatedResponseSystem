class Appointment < ActiveRecord::Base
# realtionships
belongs_to :user
belongs_to :consultant, class_name: "User"


 validates :name, presence: true
  # validates :email, presence: true
  validates :time, presence: true
  validates_uniqueness_of :time

  def start_time
  	time
  end
 
 # get all the appointments for the following day
 def self.following_day_appointments
  all.where("time >= ?", (Time.now + 3.hours))
 end

end
