class Stay < ActiveRecord::Base
  belongs_to :entitlement

  validates :entry_date, presence: true
end
