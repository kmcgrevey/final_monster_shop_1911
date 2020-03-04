require 'rails_helper'

RSpec.describe 'As a Merchant Employee' do
  describe 'When I visit my bulk discount index page' do

    before(:each) do
      @megs_shop = Merchant.create!(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      @discount1 = @megs_shop.discounts.create(name: "Buy 5 get 5%", percent_off: 0.05, bulk_minimum: 5)
      @discount2 = @megs_shop.discounts.create(name: "Buy 10 get 10%", percent_off: 0.10, bulk_minimum: 10)

      visit "/merchant_employee/merchants/#{@megs_shop.id}/discounts"
    end

    it 'I see a list of my discounts' do
      within "#discount-#{@discount1.id}" do
        expect(page).to have_content(@discount1.name)
        expect(page).to have_content("5%")
        expect(page).to have_content(@discount1.bulk_minimum)
      end

      within "#discount-#{@discount2.id}" do
        expect(page).to have_content(@discount2.name)
        expect(page).to have_content("10%")
        expect(page).to have_content(@discount2.bulk_minimum)
      end
    end

    it 'I can delete a discount from its delete link' do
      within "#discount-#{@discount1.id}" do
        expect(page).to have_link("Delete")
      end

      within "#discount-#{@discount2.id}" do
        click_link "Delete"
      end

      visit "/merchant_employee/merchants/#{@megs_shop.id}/discounts"

      expect(page).to have_content(@discount1.name)
      expect(page).not_to have_content(@discount2.name)

    end
  end
end
