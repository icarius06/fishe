class Catch <ActiveRecord::Base
	belongs_to :user
	has_many :catch_profiles

	accepts_nested_attributes_for :catch_profiles

	def name
		return User.find(self.user_id).name.to_s+" "+self.created_at.to_s
	end
end