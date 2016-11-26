class Group < ApplicationRecord
  has_and_belongs_to_many :members, class_name: 'User'

  # has_many :members, through: :user_group, source: :User # may be wrong
	validates :name, :location, { presence: :true }

	def self.search(group_name)
   	where("name ILIKE ? ", "%#{group_name}%") 
 	end

end
