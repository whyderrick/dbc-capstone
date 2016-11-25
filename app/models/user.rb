class User < ApplicationRecord
	has_secure_password

	has_many :photos
  has_and_belongs_to_many :groups, foreign_key: :member_id
  # has_many :groups, through: :user_groups
  has_many :requested_walks, foreign_key: :requester_id, class_name: 'Walk'
  has_many :guarded_walks, foreign_key: :guardian_id, class_name: 'Walk'
	validates :username, :email, :password_digest, :verified, { presence: :true }
end
