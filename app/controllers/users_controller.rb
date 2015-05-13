class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.entitlements.build
    @user.entitlements.first.stays.build
  end

  def create
    @user = User.new(user_params) 

    if @user.save!
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    @entitlement = @user.entitlements.first
    @stays = @entitlement.stays
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

private

  def user_params
    params.require(:user).permit(:first_name, :surname, :email, 
                                 entitlements_attributes: [:name, :description, :time_to_qualify, :country,
                                 stays_attributes: [:origin, :destination, :entry_date, :exit_date, :_destroy]])
  end
end