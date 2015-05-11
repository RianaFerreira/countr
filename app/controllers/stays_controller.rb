class StaysController < ApplicationController
  def index
    @stays = Stay.all
  end

  def new
    @stay = Stay.new
  end

  def create
    stay = Stay.new(stay_params)
    if stay.save!
      flash[:notice] = 'Stay created.'
      redirect_to stays_path
    else
      flash[:error] = 'Failed to create stay.'
      render 'new'
    end
  end

  def destroy
    stay = Stay.find(params[:id])

    if stay.destroy
      flash[:notice] = "Successfully removed stay."
    else
      flash[:error] = "Failed to remove stay."
    end

    redirect_to stays_path
  end

  private

  def stay_params
    params.require(:stay).permit(:entry_date, :exit_date, :time_to_qualify)
  end
end
