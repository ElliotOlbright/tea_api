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
  end 
end 