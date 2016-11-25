require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user){User.new(username: 'derrick', email: 'derrick@derrick.com', password: 'aaa', verified: true )}
  describe "it has attributes" do
    it "has a username" do
      should validate_presence_of( :username )
      expect( user.username ).to be_a(String)
      expect( user.username ).to eq 'derrick'
    end

    it "has an email" do
      should validate_presence_of( :email )
      expect( user.email ).to eq 'derrick@derrick.com'
    end

    it "has a password_digest" do
      should validate_presence_of( :password_digest )
      expect( user.password_digest).to_not eq 'aaa'
      expect( user.password ).to eq 'aaa'
    end

    it "has a verified property" do
      expect( !!user.verified ).to eq true
      expect( user.verified ).to eq true
    end
  end

  describe "it has associations" do
    it {should have_many(:photos)}

    it {should have_and_belong_to_many(:groups)}

    it {should have_many(:requested_walks)}

    it {should have_many(:guarded_walks)}

  end
end
