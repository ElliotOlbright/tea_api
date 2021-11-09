class Api::V1::AddressesController < ApplicationController
  def show 
    user = User.find_by(id: address_params[:user_id].to_i)
    address = user.addresses
    render json: AddressSerializer.new(address)
  end 

  private

  def address_params
    params.permit(
      :id,
      :user_id
    )
  end
end 