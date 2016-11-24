class User < ApplicationRecord
	has_many :photos

	validates :username, :email, :password_hash, :verified, { presence: :true }
end
