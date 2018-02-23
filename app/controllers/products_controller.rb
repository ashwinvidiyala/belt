class ProductsController < ApplicationController
  def index
    @unpurchased_products = Product.all.where(buyer_id: 0)
  end

  def create
    Product.create(product_params)
    redirect_to user_path current_user
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy

    return redirect_to user_path current_user
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :amount).merge(user: current_user)
  end
end
