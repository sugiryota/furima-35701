class PaysController < ApplicationController
  before_action :authenticate_user!, expect: :index
  def index
    @item=Item.find(params[:item_id])
    @pay_address = PayAddress.new
  end
  def create
    
    @pay_address = PayAddress.new(pay_params)
    if @pay_address.valid?
      pay_item
      @pay_address.save
      redirect_to root_path
    else
      @item=Item.find(params[:item_id])
      render :index
    end
  end

  private

  def pay_params
    params.require(:pay_address).permit(:address,:postal_code, :prefecture_id, :city, :phone_number, :building_name).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    @item=Item.find(params[:item_id])
    Payjp.api_key = "sk_test_c1678ffb13f80a63bc9d3c36"  
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: pay_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
