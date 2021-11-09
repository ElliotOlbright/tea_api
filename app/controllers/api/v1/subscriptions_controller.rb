class Api::V1::SubscriptionsController < ApplicationController

  def index 
    user = User.find(params[:user_id])

    subscriptions = user.subscriptions
    render json: SubscriptionSerializer.new(subscriptions)
  end 

  def show 
    user = User.find_by(id: subscription_params[:user_id].to_i)
    subscription = user.subscriptions
    render json: SubscriptionSerializer.new(subscription)
  end 

  def create  
    user = User.find_by(id: params[:user_id].to_i)
    subscription = user.subscriptions.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription)
    else
      render json: { error: "An existing User id is required to create a subscription" }, status: :not_found
    end 
  end 
  
  private

  def subscription_params
    params.permit(
      :user_id,
      :title,
      :price,
      :frequency,
      :status
    )
  end
end 