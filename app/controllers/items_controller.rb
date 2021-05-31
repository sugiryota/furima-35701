class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit,:update]
  before_action :move_to_root, only: :edit
  def index
    @items = Item.all.order('created_at DESC')
    
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

  def show
  end

  def edit

  end

  def update
    
    if @item.update(item_params)
      redirect_to root_path
    else
      # @item = Item.find(params[:id])
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :item_condition_id, :delivery_charge_id, :prefecture_id,
                                 :delivery_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root
    
    redirect_to root_path if @item.user_id == current_user.id && @item.pay.present?
  end
end
