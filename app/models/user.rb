class User < ActiveRecord::Base
  has_many :entitlements
end
