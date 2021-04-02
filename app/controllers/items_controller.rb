class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    if @item.save
      redirect_to root_path
    else
      render action: :new
   end
  end

  # def show
  # end

  #def edit
  #end

  #def update
  #end

  #def destroy
  #end
end
