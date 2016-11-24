class Walk < ApplicationRecord
	has_many :reports
	has_many :conversations
  belongs_to :requester, class_name: :User
  belongs_to :guardian, class_name: :User

end
