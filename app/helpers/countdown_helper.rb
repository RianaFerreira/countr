module CountdownHelper
  def qualified_for?(entitlement)
    if (entitlement.method('calculate_total_time_present').call / 365) >= 4
      render 'no_countdown', locals: @entitlement
    else
      render 'countdown', locals: @entitlement
    end
  end
end
