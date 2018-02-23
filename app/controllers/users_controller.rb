class UsersController < ApplicationController
  def new

  end

  def create
    user = User.create(user_params)

    unless user.valid?
      flash[:errors] = user.errors.full_messages
      return redirect_to new_user_path
    end

    session[:user_id] = user.id
    return redirect_to products_path
  end

  def show
    @user = User.find(params[:id])
    @my_products_not_yet_sold = Product.all.where(buyer_id: 0).where(user: @user)
    @my_products_sold = Product.all.where.not(buyer_id: 0).where(user: @user)
    @products_bought = Product.all.where(buyer_id: @user.id)
    @total_sales = @my_products_sold.sum('amount')
    @total_purchases = @products_bought.sum('amount')
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                  :password, :password_confirmation)
  end
end
