class Public::CartItemsController < ApplicationController

  def index
      @cart_items = CartItem.all
      @total = 0
  end


  def create
      binding.pry
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
      redirect_to cart_items_path
  end

  def update
      @cart_item = CartItem.find(params[:id])
      @cart_item.update(update_cart_item_params)
      redirect_to cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :image_id, :amount)
  end

  def update_cart_item_params
      params.require(:cart_item).permit(:amount)
  end

end