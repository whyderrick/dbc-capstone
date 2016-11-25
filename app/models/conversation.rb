class Conversation < ApplicationRecord
  belongs_to :walk

  validates :msg, { presence: :true }
end
