class Api::V1::CancelSubscriptionsController < ApplicationController

  def update 
    subscription = Subscription.find(params[:id])
    subscription.update(
      status:  1
    )
    if subscription.save
      render json: SubscriptionSerializer.new(subscription)
    else 
      render json: { error: "An existing subscription id is required to create a subscription" }, status: :not_found
    end 
  end 

  # def subscription_params
  #   params.permit(
  #     :user_id,
  #     :title,
  #     :price,
  #     :frequency,
  #     :status
  #   )
  # end
end 