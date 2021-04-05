class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
   end
  end

  def show
    @item = Item.find(params[:id])
  end

  #def edit
  #end

  #def update
  #end

  #def destroy
  #end
end

private

def item_params
  params.require(:item).permit(:name,:image,:text,:category_id,:status_id,:area_id,:cost_id,:delivery_id,:price).merge(user_id: current_user.id)
end
