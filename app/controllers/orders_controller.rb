class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

 
  def sales
    @orders = Order.all.where(seller: current_user).order("Created_at DESC")
  end
  
  def purchases
    @orders = Order.all.where(buyer: current_user).order("Created_at DESC")
  end
  
  def new
    @order = Order.new
    @listing=Listing.find(params[:listing_id])
    respond_with(@order)
  end

  def create
    @order = Order.new(order_params)
    @listing=Listing.find(params[:listing_id])
    @order.buyer_id=current_user.id
    @order.listing_id=@listing.id
    @order.seller_id=@listing.user_id
    if @order.save
      respond_to do |format|
        format.html {redirect_to purchases_url, notice: 'Order was successfully created' }
        format.json { head :no_content }
      end
    end
  end



  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:address1, :address2, :city, :state, :zip_code, :quantity, :integer)
    end
end
