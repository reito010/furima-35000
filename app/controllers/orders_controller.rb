class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :move_to_index, only: [:create]
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item 
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def move_to_index
    #move_to_indexがコントローラーで１番最初にみる＝ @item = Item.find(params[:item_id])をかく
    @item = Item.find(params[:item_id])
    unless current_user == @item.user
     redirect_to action: :index
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :area_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
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
