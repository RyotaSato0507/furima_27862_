class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user, except: [:index, :show]
  def index
    @items = Item.includes(:images)
  end
  def new
    @item = Item.new
    @item = images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      ridirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
