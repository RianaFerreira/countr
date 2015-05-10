class StaysController < ApplicationController
  def new
    @stay = Stay.new
  end

  def create
    Stay.create(stay_params)
  end

  private

  def stay_params
    params.require(:stay).permit(:entry_date, :exit_date)
  end
end
