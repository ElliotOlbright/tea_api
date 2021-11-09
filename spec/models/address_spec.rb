require 'rails_helper'

RSpec.describe Address do
  describe 'associations' do 
    it { should belong_to(:user) }
  end 
end