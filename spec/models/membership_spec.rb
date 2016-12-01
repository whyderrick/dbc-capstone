require 'rails_helper'

RSpec.describe Membership, type: :model do
  it { should belong_to(:member) }
  it { should belong_to(:group) }
end
