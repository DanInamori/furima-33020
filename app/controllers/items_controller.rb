class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if (current_user.id != @item.user.id) || (@item.order.present?)
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
