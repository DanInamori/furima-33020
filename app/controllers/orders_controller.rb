class OrdersController < ApplicationController
before_action :authenticate_user!
before_action :set_order, only: [:index, :create]
before_action :move_to_index, only: [:index, :create]

  def index
    @order_data = OrderData.new
  end

  def create
    @order_data = OrderData.new(order_params)
    if @order_data.valid?
      pay_item
      @order_data.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_data).permit(:postal_code, :prefecture_id, :municipality, :house_num, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def move_to_index
    if (current_user.id == @item.user_id) || (@item.order.present?)
      redirect_to root_path
    end
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy' 
      )
  end
end
