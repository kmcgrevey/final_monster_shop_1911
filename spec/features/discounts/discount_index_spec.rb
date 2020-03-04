require 'rails_helper'

RSpec.describe 'As a Merchant Employee' do
  describe 'When I visit my dashboard' do

    before(:each) do
      @megs_shop = Merchant.create!(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)

      visit '/merchant_employee/dashboard'
    end

    xit 'I see a link to my bulk discounts' do
      click_link "Bulk Discounts"

      expect(current_path).to eq("/merchant_employee/merchants/#{@megs_shop.id}/discounts")
    end
  end
end
