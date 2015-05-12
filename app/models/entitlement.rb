class Entitlement < ActiveRecord::Base
  belongs_to :user
  has_many   :stays
end
