class Api::V1::UsersController < ApplicationController
  def show
    user = User.find_by(id: user_params[:id])
    render json: UserSerializer.new(user)
  end 

  def create 
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user)
    else 
      render json: { error: "Please fill in all" }, status: :not_found
    end 
  end

  private
  def user_params
    params.permit(
      :id,
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end 