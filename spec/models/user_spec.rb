require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user){User.new(username: 'derrick', email: 'derrick@derrick.com', password: 'aaa', verified: true )}
  describe "it has attributes" do
    it "has a username" do
      expect( user.username ).to_not eq nil
      expect( user.username ).to eq 'derrick'
    end

    it "has an email" do
      expect( user.email ).to_not eq nil
      expect( user.email ).to eq 'derrick@derrick.com'
    end

    it "has a password_digest" do
      expect( user.password_digest ).to_not eq nil
      expect( user.password_digest ).to eq 'aaa'
    end
  end
end
