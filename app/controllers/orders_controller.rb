class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
 
  def index
  end

  def create
    @order = Order.create(order_params)
    Address.create(shared_params)
    redirect_to root_path

  end

  private

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def shared_params
    params.permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(order_id: @order.id)
  end
end
