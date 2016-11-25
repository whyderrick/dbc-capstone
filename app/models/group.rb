class Group < ApplicationRecord
  has_and_belongs_to_many :members, class_name: 'User', association_foreign_key: :member_id

  # has_many :members, through: :user_group, source: :User # may be wrong
	validates :name, :location, { presence: :true }
end
