class CountdownController < ApplicationController
  def index
    user = if params[:user_id].present?
            User.find(params[:user_id])
          else 
            User.last
          end
    @entitlement = user.entitlements.first

    respond_to do |format|
      format.html
      format.json { render json: @entitlement }
    end
  end
end
