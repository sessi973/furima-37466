class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
    
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
end
end