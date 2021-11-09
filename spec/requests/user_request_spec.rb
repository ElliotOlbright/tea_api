require 'rails_helper'

RSpec.describe 'users API' do
  before :each do
    @user = User.create!(
      email: "whatever@example.com",
      first_name: "First",
      last_name: "Last",
      password: "password",
      password_confirmation: "password"
    )
  end

  it 'returns the users attributes and relationships' do

    get "/api/v1/users/#{@user.id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    user_info = JSON.parse(response.body, symbolize_names: true)

    expect(user_info).to have_key(:data)
    expect(user_info[:data]).to be_a(Hash)
    expect(user_info[:data].keys.count).to eq(3)
    expect(user_info[:data]).to have_key(:id)
    expect(user_info[:data][:id]).to be_a(String)
    expect(user_info[:data]).to have_key(:type)
    expect(user_info[:data][:type]).to eq("user")
    expect(user_info[:data]).to have_key(:attributes)
    expect(user_info[:data][:attributes]).to be_a(Hash)
    expect(user_info[:data][:attributes].keys.count).to eq(3)
  end 
end 