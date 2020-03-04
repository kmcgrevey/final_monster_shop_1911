class MerchantEmployee::DiscountsController < ApplicationController
# class MerchantEmployee::DiscountsController < MerchantEmployee::BaseController

# similar coding as ItemsController
  def new
    @merchant = Merchant.find(params[:id])
  end

  def create
    @merchant = Merchant.find(params[:id])
    @discount = @merchant.discounts.create(discount_params)
  end

  private

  def discount_params
    params.permit(:name,
			            :percent_off,
			            :bulk_minimum)
  end
end
