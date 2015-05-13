class Entitlement < ActiveRecord::Base
  belongs_to :user
  has_many   :stays, autosave: true
  accepts_nested_attributes_for :stays, allow_destroy: true

  validates :name, :time_to_qualify, presence: true
end
