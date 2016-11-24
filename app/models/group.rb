class Group < ApplicationRecord

	validates :name, :location, { presence: :true }
end
