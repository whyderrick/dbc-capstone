class Invite < ApplicationRecord
  belongs_to :group
  belongs_to :sender, class_name: 'User'
  has_one :recipient, class_name: 'User'

  validates :recipient_email, :group, :sender_id, :token, {presence: true}
  validates :recipient_email, {uniqueness: true, scope: :group}
end
