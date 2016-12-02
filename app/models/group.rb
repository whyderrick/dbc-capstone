class Group < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships
  has_many :invites

	validates :name, :location, { presence: :true }

	def self.search(group_name)
   	where("name ILIKE ? ", "%#{group_name}%")
 	end

  def available_walks
    members = self.members
    walks = members.map do |member|
      member.requested_walks.where( accepted: false )
    end
    walks.flatten
  end
end
