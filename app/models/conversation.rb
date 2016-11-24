class Conversation < ApplicationRecord
  belongs_to :walks

  validates :msg, { presence: :true }
end
