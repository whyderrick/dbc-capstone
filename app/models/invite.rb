class Invite < ApplicationRecord
  belongs_to :group
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User', optional: true

  validates :recipient_email, :group_id, :sender_id, :token, {presence: true}
  validates :recipient_email, {uniqueness: { scope: :group } }
end
