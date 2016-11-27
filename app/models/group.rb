class Group < ApplicationRecord
  has_many :memberships
  has_many :members, through: :memberships
	validates :name, :location, { presence: :true }

	def self.search(group_name)
   	where("name ILIKE ? ", "%#{group_name}%") 
 	end

end
