class Api::V1::ArchiveSubscriptionsController < ApplicationController

  def index
    user = User.find(params[:user_id])

    subscriptions = user.subscriptions
    archived_subscriptions = subscriptions.where(status: 'archived')

    render json: ArchiveSubscriptionsSerializer.new(archived_subscriptions)
  end 
end 