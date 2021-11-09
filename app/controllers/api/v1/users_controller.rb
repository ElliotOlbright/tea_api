class Api::V1::UsersController < ApplicationController
  def show
    user = User.find_by(id: user_params[:id])
    render json: UserSerializer.new(user)
  end 

  private
  def user_params
    params.permit(:id)
  end
end 