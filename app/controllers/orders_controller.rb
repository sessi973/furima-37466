class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create ]

  def index
    @order_shared = OrderShared.new
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
  Payjp.api_key = "sk_test_b3be94833f43683e0320ec79"  
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