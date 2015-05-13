class StaysController < ApplicationController
  def index
    @stays = Stay.all
  end

  def new
    @stay = Stay.new
  end

  def create
    stay = Stay.new(stay_params)
    stay.save!
    redirect_to stays_path
  end

  def destroy
    stay = Stay.find(params[:id])
    stay.destroy
    redirect_to stays_path
  end

  private

  def stay_params
    params.require(:stay).
    permit(:origin, :destination, :entry_date, :exit_date, :time_to_qualify)
  end
end
