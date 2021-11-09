require 'rails_helper'

RSpec.describe 'Subscriptions API' do 
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

    @subscription = @user.subscriptions.create!(
      title: "Blueberry Habiscus",
      price: 10000,
      frequency: 1
    )
  end

  it 'can return a users subscriptions' do 
    get "/api/v1/users/#{@user.id}/subscriptions/#{@subscription.id}"

    expect(response).to be_successful
    expect(response.status).to eq (200)

    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(subscription).to have_key(:data)
    expect(subscription[:data].count).to eq(1)
    expect(subscription[:data][0]).to have_key(:id)
    expect(subscription[:data][0][:id]).to be_a(String)
    expect(subscription[:data][0]).to have_key(:type)
    expect(subscription[:data][0][:type]).to eq("subscription")
    expect(subscription[:data][0]).to have_key(:attributes)
    expect(subscription[:data][0][:attributes]).to be_a(Hash)
    expect(subscription[:data][0][:attributes].keys.count).to eq(4)
    expect(subscription[:data][0][:attributes]).to have_key(:title)
    expect(subscription[:data][0][:attributes][:title]).to be_a(String)
    expect(subscription[:data][0][:attributes]).to have_key(:price)
    expect(subscription[:data][0][:attributes][:price]).to be_a(Integer)
    expect(subscription[:data][0][:attributes]).to have_key(:status)
    expect(subscription[:data][0][:attributes][:status]).to be_a(String)
    expect(subscription[:data][0][:attributes]).to have_key(:frequency)
    expect(subscription[:data][0][:attributes][:frequency]).to be_a(Integer)
  end 

  it 'can create a users subscription' do 
    body = { 
      title: "Green Tea",
      price: 15000,
      frequency: 0
     }
    post "/api/v1/users/#{@user.id}/subscriptions", params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq (200)

    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(subscription).to have_key(:data)
    expect(subscription[:data].count).to eq(3)
    expect(subscription[:data]).to have_key(:id)
    expect(subscription[:data][:id]).to be_a(String)
    expect(subscription[:data]).to have_key(:type)
    expect(subscription[:data][:type]).to eq("subscription")
    expect(subscription[:data]).to have_key(:attributes)
    expect(subscription[:data][:attributes]).to be_a(Hash)
    expect(subscription[:data][:attributes].keys.count).to eq(4)
    expect(subscription[:data][:attributes]).to have_key(:title)
    expect(subscription[:data][:attributes][:title]).to be_a(String)
    expect(subscription[:data][:attributes]).to have_key(:price)
    expect(subscription[:data][:attributes][:price]).to be_a(Integer)
    expect(subscription[:data][:attributes]).to have_key(:status)
    expect(subscription[:data][:attributes][:status]).to be_a(String)
    expect(subscription[:data][:attributes]).to have_key(:frequency)
    expect(subscription[:data][:attributes][:frequency]).to be_a(Integer)
  end 
end