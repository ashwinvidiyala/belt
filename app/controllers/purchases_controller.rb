class PurchasesController < ApplicationController
  def create
    product = Product.find(params[:id])
    product.buyer_id = current_user.id
    product.date_bought = Date.today
    product.save

    return redirect_to user_path current_user
  end


end
