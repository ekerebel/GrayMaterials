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
    
    Stripe.api_key = ENV["STRIPE_API_KEY"]
    token = params[:stripeToken]
    begin
      charge = Stripe::Charge.create(
        :amount => (@listing.price * 100).floor,
        :currency => "usd",
        :card => token
        )
      flash[:notice] = "Thanks for ordering!"
    rescue Stripe::CardError => e
      flash[:danger] = e.message
    end
    
    transfer = Stripe::Transfer.create(
      :amount => (@listing.price * 95 -2.9*@listing.price).floor,
      :currency => "usd",
      :recipient => @listing.account.recipient
      )
    
    if @order.save
      respond_to do |format|
        format.html {redirect_to purchases_url}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
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
