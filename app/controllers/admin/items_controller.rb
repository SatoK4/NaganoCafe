class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    # 後ほど商品詳細ページへ
    redirect_to about_path
  end

  def show
  end

  def edit
  end

  def update
  end


  private
  def item_params
    params.requie(:item).permit(:image, :name, :introduction)
  end
end
