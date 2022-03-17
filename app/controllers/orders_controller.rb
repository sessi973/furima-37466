class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create ]
  

  def index
    @order_shared = OrderShared.new
    if current_user.id == @item.user_id || @item.order.present? 
      redirect_to root_path
    end
  end


  def create
    @order_shared = OrderShared.new(order_params)
    if @order_shared.valid?
      pay_item
      @order_shared.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shared).permit(:postal_code, :prefecture_id, :city, :addresses, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]   
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],  
        currency: 'jpy'                 
      )
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
end
