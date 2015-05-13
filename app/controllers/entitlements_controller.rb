class EntitlementsController < ApplicationController
  def index
    @entitlements = Entitlement.all
  end

  def new
    @entitlement = Entitlement.new
  end

  def create
    @entitlement = Entitlement.new(entitlement_params)
    @entitlement.save!
  end

private
  
  def entitlement_params
    params.require(:entitlement).
    permit(:name, :description, :country, :time_to_qualify,
            stays_attributes: [:origin, :destination, :entry_date, :exit_date])
  end
end