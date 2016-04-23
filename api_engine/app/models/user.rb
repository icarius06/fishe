class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :notifications
  has_many :bids
  has_many :catches
  belongs_to :location

  accepts_nested_attributes_for :profile
  
  after_create :build_profile

  def build_profile
    Profile.create(user: self) # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end

  def name
  	if !self.new_record?
	  	user_profile = Profile.find_by_user_id(self.id)
	  	return user_profile.fname + " " + user_profile.lname 
	  end
  end
end
