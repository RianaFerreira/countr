class CountdownController < ApplicationController
  def index
    user = User.find_by_first_name('Riana')
    @entitlement = user.entitlements.first
    @total_time_in_au = 0

    @entitlement.stays.each do |stay|
      @total_time_in_au += ((stay.exit_date.presence || Date.today) - stay.entry_date).to_i
    end


  end
end
