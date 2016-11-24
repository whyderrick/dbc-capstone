class Walk < ApplicationRecord
	has_many :reports
	has_many :conversations
end
