class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :seller]
  before_filter :check_user, only: [:edit, :update, :destroy]


  def seller
    @listings = Listing.where(user: current_user).order("created_at DESC")
  end
  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all.order("created_at DESC")
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end
  
  # GET /listings/1/edit
  def edit

  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    
    
    respond_to do |format|
      if @listing.save
        format.html { redirect_to seller_url, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to seller_url, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #Method for updating Grades based on Material
  def update_grade_select
    @grades= Grade.where(:material_id => params[:id])
    render :partial => "grades"
  end
  
  def update_shape_select
    @shape= Shape.find(params[:shape])
    render :partial =>  "dimensions", locals: {fixed_dimensions: params[:fixed_dimensions]} 
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to seller_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :account_id, :description, :price, :image, :shape_id, :SKU, :A, :B, :C, :D, :OD, :wall, :dimension_ID, :thickness, :width, :length, :grade_id, :material_id, :specification, :inventory, :fixed_dimensions, :weight, :minimum_quantity, :maximum_width, :maximum_length, :price_per_lb, :mill_test_report)
    end
    
    def check_user
      if current_user!=@listing.user
        redirect_to root_url, alert: "Sorry, this listing belongs to someone else"
      end
    end
end
