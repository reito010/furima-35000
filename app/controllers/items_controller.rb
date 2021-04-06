class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else 
      render action: :edit
    end
  end

  #def destroy
  #end


 
private

 def item_params
  params.require(:item).permit(:name,:image,:text,:category_id,:status_id,:area_id,:cost_id,:delivery_id,:price).merge(user_id: current_user.id)
 end

 def set_item
  @item = Item.find(params[:id])
end

 def move_to_index
  unless current_user == @item.user
    redirect_to action: :index
  end
end
