class Api::V1::AddressesController < ApplicationController

  def show 
    user = User.find_by(id: address_params[:user_id].to_i)
    address = user.addresses
    render json: AddressSerializer.new(address)
  end 

  def create  
    user = User.find_by(id: params[:user_id].to_i)
    address = user.addresses.new(address_params)
    if address.save
      render json: AddressSerializer.new(address)
    else
      render json: { error: "An existing User id is required" }, status: :not_found
    end 
  end 
  
  private

  def address_params
    params.permit(
      :user_id,
      :street,
      :city,
      :state,
      :zipcode
    )
  end
end 