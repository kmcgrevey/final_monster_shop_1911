require 'rails_helper'

RSpec.describe Cart do

  describe "Instance methods" do
		before(:each) do
		  @mike = Merchant.create(name: "Mike's Print Shop", address: '123 Paper Rd.', city: 'Denver', state: 'CO', zip: 80203)
			@paper = @mike.items.create(name: "Lined Paper", description: "Great for writing on!", price: 20, image: "https://cdn.vertex42.com/WordTemplates/images/printable-lined-paper-wide-ruled.png", inventory: 25)
	    @pencil = @mike.items.create(name: "Yellow Pencil", description: "You can write on paper with it!", price: 2, image: "https://images-na.ssl-images-amazon.com/images/I/31BlVr01izL._SX425_.jpg", inventory: 100)
			@cart ||= Cart.new(Hash.new(0))
			@cart.add_item(@paper.id.to_s)
		end

    it ".add_item" do
			expect(@cart.contents[@paper.id.to_s]).to eq(1)
			@cart.add_item(@paper.id.to_s)
			expect(@cart.contents[@paper.id.to_s]).to eq(2)
    end

		it ".total_items" do
			expect(@cart.total_items).to eq(1)
			@cart.add_item(@pencil.id.to_s)
			expect(@cart.total_items).to eq(2)
		end

		it ".items" do
			expect(@cart.items).to include(@paper)
		end

		it ".subtotal" do
			expect(@cart.subtotal(@paper)).to eq(20)
		end

		it ".total" do
			expect(@cart.total).to eq(20)
			@cart.add_item(@paper.id.to_s)
			expect(@cart.total).to eq(40)
		end

		it ".limit_reached?" do
			expect(@cart.limit_reached?(@paper.id.to_s)).to eq(false)
		end

		it ".add_quantity" do
			expect(@cart.add_quantity(@paper.id.to_s)).to eq(2)
		end

		it ".subtract_quantity" do
			expect(@cart.subtract_quantity(@paper.id.to_s)).to eq(0)
		end

		it ".quantity_zero?" do
			expect(@cart.quantity_zero?(@paper.id.to_s)).to eq(false)
			@cart.subtract_quantity(@paper.id.to_s)
			expect(@cart.quantity_zero?(@paper.id.to_s)).to eq(true)
		end
  end
end
