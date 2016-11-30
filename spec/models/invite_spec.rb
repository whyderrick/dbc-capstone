require 'rails_helper'

RSpec.describe Invite, type: :model do
  let(:user1){ User.create( username: "apple", email: "apple@apple.com", password: "apple" )}
  let(:user2){ User.create( username: "banana", email: "banana@banana.com", password: "banana" )}
  let(:cherry){ Group.create( name: "Cherry", location: "Cherry City, CA" ) }

  let(:invite){ Invite.new( sender_id: user1.id, group_id: cherry.id, recipient_email: 'durian@durian.com' )}

  context "Attributes and Validations" do
    it "has an integer sender_id" do
      expect(invite.sender_id).to_not be nil
      expect(invite.sender_id).to be_an(Integer)
      expect(invite.sender_id).to eq user1.id
    end

    it "has an integer group_id" do
      expect(invite.group_id).to_not be nil
      expect(invite.group_id).to be_a(Integer)
      expect(invite.group_id).to eq cherry.id
    end

    it "has an string recipient_email" do
      expect(invite.recipient_email).to_not be nil
      expect(invite.recipient_email).to be_a(String)
      expect(invite.recipient_email).to eq "durian@durian.com"
    end

    it "is invalid without a token" do
      invite.token = nil
      expect(invite).to be_invalid
    end

    it "is automatically assigned a token on creation" do
      invite.token = nil
      invite.save

      expect(invite.token).to_not be nil
    end
  end

  context "Associations" do
    it{ should belong_to(:recipient).class_name('User') }
    it{ should belong_to(:group)}
    it{ should belong_to(:sender).class_name('User') }
  end

end
