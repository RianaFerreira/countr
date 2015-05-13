class User < ActiveRecord::Base
  has_many :entitlements, autosave: true
  accepts_nested_attributes_for :entitlements, allow_destroy: true

  validates :first_name, :surname, :email, presence: true
end
