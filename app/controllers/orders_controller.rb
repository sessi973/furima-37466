class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
 
  def index
    @order_shared = OrderShared.new
  end

  def create
    @order_shared = OrderShared.new(order_params)
    if @order_shared.valid?
      @order_shared.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shared).permit(:postal_code, :prefecture_id, :city, :addresses, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end