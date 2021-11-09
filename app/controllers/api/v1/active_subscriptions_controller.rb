class Api::V1::ActiveSubscriptionsController < ApplicationController

  def index
    user = User.find(params[:user_id])

    subscriptions = user.subscriptions
    active_subscriptions = subscriptions.where(status: 'active')

    render json: ActiveSubscriptionsSerializer.new(active_subscriptions)
  end 
end 
