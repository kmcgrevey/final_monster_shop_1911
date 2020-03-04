class MerchantEmployee::DiscountsController < ApplicationController
# class MerchantEmployee::DiscountsController < MerchantEmployee::BaseController

  def new
    @merchant = Merchant.find(params[:id])
  end

  def create
    # discount = Discount.create(discount_params)
  #   if merchant.save
  #     redirect_to merchants_path
  #   else
  #     flash[:error] = merchant.errors.full_messages.to_sentence
  #     render :new
  #   end
  end

  # private
  #
  # def discount_params
  #   params.permit(:name,
	# 		            :percent_off,
	# 		            :bulk_minimum)
  # end
end
