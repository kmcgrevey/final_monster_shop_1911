require 'rails_helper'

RSpec.describe 'As a Merchant Employee' do
  describe 'When I visit the Discount new page. ' do

    it 'I can create a new Discount' do
      visit new_discount_path

      name = "Buy 5 Get 10%"
      percent = 0.1
      bulk_min = 5

      fill_in :name, with: name
      fill_in :percent_off, with: percent
      fill_in :bulk_minimum, with: bulk_min
# save_and_open_page
      click_button "Create Discount"
    end
  end
end
