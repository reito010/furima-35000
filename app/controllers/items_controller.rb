class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit]
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path
    else 
      render action: :edit
    end
  end

  #def destroy
  #end
end

 private

 def item_params
  params.require(:item).permit(:name,:image,:text,:category_id,:status_id,:area_id,:cost_id,:delivery_id,:price).merge(user_id: current_user.id)
 end

 def move_to_index
  @item = Item.find(params[:id])
  unless current_user == @item.user
    redirect_to action: :index
  end
end
