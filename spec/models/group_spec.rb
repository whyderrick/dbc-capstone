require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group){ Group.new(name:"Group1", location:
    "Oakland, CA") }

  describe "Attributes and Validations" do
    it "has a name" do
      expect( group.name ).to be_a(String)
      expect( group.name ).to eq "Group1"
    end

    it "has a location" do
      expect( group.location ).to be_a(String)
      expect( group.location ).to eq "Oakland, CA"
    end

    it "is invalid without a name" do
      g2 = Group.new(location: "Oakland, CA")

      expect( g2 ).not_to be_valid
    end

    it "is invalid without a location" do
      g2 = Group.new( name: "Super Group" )

      expect( g2 ).not_to be_valid
    end
  end

  describe "Associations" do
    it {should have_many(:members).through(:memberships)}
  end
end
