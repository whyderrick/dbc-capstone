class User < ApplicationRecord
	has_secure_password

	 has_many :messages
  has_many :chatrooms, through: :messages

	has_many :photos
  has_many :memberships, foreign_key: :member_id
  has_many :groups, through: :memberships
  has_many :requested_walks, foreign_key: :requester_id, class_name: 'Walk'
  has_many :guarded_walks, foreign_key: :guardian_id, class_name: 'Walk'
	validates :username, :email, :password_digest, { presence: :true }
end
