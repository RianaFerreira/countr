class Entitlement < ActiveRecord::Base
  belongs_to :user
  has_many   :stays, autosave: true
  accepts_nested_attributes_for :stays, allow_destroy: true

  validates :name, :time_to_qualify, presence: true

  def days_to_entitlement
    365 - remaining_time
  end

  def weeks_to_entitlement
    (52 - (remaining_time / 7)) > 1 ? 52 - (remaining_time / 7) : 0
  end

  def months_to_entitlement
    (12 - (remaining_time / 30)) > 30 ? 12 - (remaining_time / 30) : 0
  end

  def weeks_spent_in_country
    calculate_total_time_present / 7
  end

  def months_spent_in_country
    calculate_total_time_present / 12
  end

  def years_spent_in_country
    # how to handle leap years properly
    calculate_total_time_present / 365
  end

  def as_json(options = {})
    super(methods: [:months_to_entitlement, :weeks_to_entitlement, :days_to_entitlement])
  end

private

  def calculate_total_time_present
    total_time_in_au = 0

    stays.each do |stay|
      total_time_in_au += ((stay.exit_date.presence || Date.today) - stay.entry_date).to_i
    end

    total_time_in_au
  end

  def remaining_time
    calculate_total_time_present % 365
  end
end
