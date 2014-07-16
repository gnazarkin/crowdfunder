class Project < ActiveRecord::Base
	belongs_to :user
	has_many :pledges
	has_many :rewards

	validates :title, :description, :goal, :end_date, presence: :true
	
end
