class Group < ApplicationRecord
  has_many :memberships
  has_many :members, through: :memberships
	validates :name, :location, { presence: :true }
end
