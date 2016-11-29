class Walk < ApplicationRecord
	has_many :reports
	has_many :conversations
  belongs_to :requester, class_name: :User
  has_one :guardian, class_name: :User
  has_one :chatroom 
end
