require 'rails_helper'

RSpec.describe 'Cancel Subscriptions API' do 
  before :each do
    @user = User.create!(
      email: "whatever@example.com",
      first_name: "First",
      last_name: "Last",
      password: "password",
      password_confirmation: "password"
    )

    @address = @user.addresses.create!(
      street: "1234 dope street",
      city: "San Francisco",
      state: "CA",
      zipcode: "12345"
    )
  end

  it 'can cancel subscriptions' do 
    body1 = { 
      title: "Green Tea",
      price: 15000,
      frequency: 0
     }
    post "/api/v1/users/#{@user.id}/subscriptions", params: body1, as: :json
    subscription1 = JSON.parse(response.body, symbolize_names: true)
    sub1_id = subscription1[:data][:id]

    patch "/api/v1/users/#{@user.id}/cancel_subscriptions/#{sub1_id}"

    expect(response).to be_successful
    expect(response.status).to eq (200)

    subscription2 = JSON.parse(response.body, symbolize_names: true)

    new_sub =(subscription2[:data][:attributes][:status])
    old_sub =(subscription1[:data][:attributes][:status])
    expect(new_sub).to_not eq(old_sub)

    expect(subscription2).to have_key(:data)
    expect(subscription2[:data].count).to eq(3)
    expect(subscription2[:data]).to have_key(:id)
    expect(subscription2[:data][:id]).to be_a(String)
    expect(subscription2[:data]).to have_key(:type)
    expect(subscription2[:data][:type]).to eq("subscription")
    expect(subscription2[:data]).to have_key(:attributes)
    expect(subscription2[:data][:attributes]).to be_a(Hash)
    expect(subscription2[:data][:attributes].keys.count).to eq(4)
    expect(subscription2[:data][:attributes]).to have_key(:title)
    expect(subscription2[:data][:attributes][:title]).to be_a(String)
    expect(subscription2[:data][:attributes]).to have_key(:price)
    expect(subscription2[:data][:attributes][:price]).to be_a(Integer)
    expect(subscription2[:data][:attributes]).to have_key(:status)
    expect(subscription2[:data][:attributes][:status]).to be_a(String)
    expect(subscription2[:data][:attributes]).to have_key(:frequency)
    expect(subscription2[:data][:attributes][:frequency]).to be_a(String)
  end 
end