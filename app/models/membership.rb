class Membership < ApplicationRecord
  belongs_to :member, class_name: 'User'
  belongs_to :group

end
