require 'rails_helper'

RSpec.describe 'As a Merchant Employee' do
  describe 'When I visit the Discount new page' do

    it 'I can create a new Discount' do
      @megs_shop = Merchant.create!(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)

      # visit new_discount_path
      visit "/merchant_employee/merchants/#{@megs_shop.id}/discounts/new"

      # save_and_open_page
      name = "Buy 5 Get 10%"
      percent = 0.1
      bulk_min = 5

      fill_in :name, with: name
      fill_in :percent_off, with: percent
      fill_in :bulk_minimum, with: bulk_min
      click_button "Create Discount"

      new_discount = Discount.last

  require "pry"; binding.pry
      expect(current_path).to eq(discounts_path) #index
      within "#discount-#{new_discount.id}" do
        expect(page).to have_content(name)
        expect(page).to have_content(percent)
        expect(page).to have_content(bulk_min)
      end
    end
  end
end
