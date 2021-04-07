class OrdersController < ApplicationController
  before_action :authenticate_user! ,only:[:index]
  before_action :set_item
  before_action :redirect_to_root ,only:[:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(oreder_params)
    if @order_address.valid?
       @order_address.save

      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def oreder_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number,:token).merge(user_id: current_user.id, item_id: params[:item_id])
  end



  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_to_root
    return redirect_to root_path if current_user.id == @item.user_id || @item.order!=nil
  end
end
