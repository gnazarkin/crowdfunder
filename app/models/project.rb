class Project < ActiveRecord::Base
	belongs_to :user
	has_many :pledges
	has_many :rewards
	mount_uploader :image, ImageUploader

	validates :name, :description, :goal, :end_date, presence: :true
	accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

	def update_funded_amount
		self.funded_amount = self.pledges.sum(:amount)
	end

end
