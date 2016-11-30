class Invite < ApplicationRecord
  belongs_to :group
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User', optional: true

  validates :recipient_email, :group_id, :sender_id, {presence: true}
  validates :recipient_email, {uniqueness: { scope: :group } }

  before_create :generate_token

  private
    def generate_token
      self.token = nil
      self.token = Digest::SHA1.hexdigest([self.group_id, Time.now, SecureRandom.random_number].join)
    end
end
