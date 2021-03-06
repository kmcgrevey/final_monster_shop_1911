class MerchantEmployee::DiscountsController < ApplicationController
# class MerchantEmployee::DiscountsController < MerchantEmployee::BaseController

# similar coding as ReviewsController
  def new
    @merchant = Merchant.find(params[:id])
  end

  def create
    @merchant = Merchant.find(params[:id])
    @discount = @merchant.discounts.create(discount_params)

    redirect_to "/merchant_employee/merchants/#{@merchant.id}/discounts"
  end

  def index
    @merchant = Merchant.find(params[:id])
    @discounts = @merchant.discounts.all
  end

  def destroy
    discount = Discount.find(params[:id])
    @merchant = discount.merchant
    discount.destroy

    redirect_to "/merchant_employee/merchants/#{@merchant.id}/discounts"
  end

  private

  def discount_params
    params.permit(:name,
			            :percent_off,
			            :bulk_minimum)
  end
end
