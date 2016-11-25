require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let( :user ){ User.create( username: 'dee', email: 'd@d.com', password: 'aaa', verified: false )}
  let( :walk ){ Walk.create( guardian_id: user.id, requester_id: user.id ) }

  # I hate how coupled this spec is to my other models, but don't know a good, quick way to avoid explicitly creating them in this model spec.

  # let( :convesation ){ Conversation.new(msg: "I'm a message", user_id: user.id, walk_id: walk.id)}

  describe "Attributes and Validations" do
    it "is valid with a msg, user_id, and walk_id" do
      convo = Conversation.new(
        msg: "I'm a message",
        user_id: user.id,
        walk_id: walk.id
      )

      expect(convo).to be_valid

    end
  end
end
