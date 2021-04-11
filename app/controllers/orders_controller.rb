class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_order, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
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
    if current_user.id == @item.user_id
     redirect_to root_path
    end
  end

  def set_order
    @item = Item.find(params[:item_id])
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
