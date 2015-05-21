module CountdownHelper
  def qualified_for_entitlement?(total_time_present)
    if (total_time_present / 365) >= 4
      true
    else
      false
    end
  end

  def weeks_spent_in_country(total_time_present)
    total_time_present / 7
  end

  def months_spent_in_country(total_time_present)
    total_time_present / 12
  end

  def years_spent_in_country(total_time_present)
    # how to handle leap years properly
    total_time_present / 365
  end

  def days_to_entitlement(total_time_present)
    365 - remaining_time(total_time_present)
  end

  def weeks_to_entitlement(total_time_present)
    52 - (remaining_time(total_time_present) / 7)
  end

  def months_to_entitlement(total_time_present)
    12 - (remaining_time(total_time_present) / 30)
  end

private
  def remaining_time(total_time_present)
    total_time_present % 365
  end
end
