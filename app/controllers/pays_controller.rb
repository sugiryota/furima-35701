class PaysController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :move_to_root, only: [:index, :create]
  def index
    
    @pay_address = PayAddress.new
  end

  def create
    @pay_address = PayAddress.new(pay_params)
    if @pay_address.valid?
      pay_item
      @pay_address.save
      redirect_to root_path
    else
    
      render :index
    end
  end

  private

  def pay_params
    params.require(:pay_address).permit(:address, :postal_code, :prefecture_id, :city, :phone_number, :building_name).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: pay_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user_id == current_user.id || @item.pay.present?
  end
end
