require 'rails_helper'

RSpec.describe 'Address API' do 
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
      zipcode: "12345",
    )
  end
  it 'can return a users address' do 
    get "/api/v1/users/#{@user.id}/addresses/#{@address.id}"

    expect(response).to be_successful
    expect(response.status).to eq (200)

    address = JSON.parse(response.body, symbolize_names: true)

    expect(address).to have_key(:data)
    expect(address[:data].count).to eq(1)
    expect(address[:data][0]).to have_key(:id)
    expect(address[:data][0][:id]).to be_a(String)
    expect(address[:data][0]).to have_key(:type)
    expect(address[:data][0][:type]).to eq("address")
    expect(address[:data][0]).to have_key(:attributes)
    expect(address[:data][0][:attributes]).to be_a(Hash)
    expect(address[:data][0][:attributes].keys.count).to eq(4)
    expect(address[:data][0][:attributes]).to have_key(:street)
    expect(address[:data][0][:attributes][:street]).to be_a(String)
    expect(address[:data][0][:attributes]).to have_key(:city)
    expect(address[:data][0][:attributes][:city]).to be_a(String)
    expect(address[:data][0][:attributes]).to have_key(:state)
    expect(address[:data][0][:attributes][:state]).to be_a(String)
    expect(address[:data][0][:attributes]).to have_key(:zipcode)
    expect(address[:data][0][:attributes][:zipcode]).to be_a(String)
  end 
end 