class OrdersController < ApplicationController
  
  def index
    @product = Product.find(params[:product_id])
    @order = UserOrder.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order = UserOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality, :building_name, :block, :phone).merge(token: params[:token], product_id: params[:product_id], user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.money,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
