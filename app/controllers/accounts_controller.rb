class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @accounts = Account.where(:user_id => current_user)
    respond_with(@accounts)
  end

  def show
    respond_with(@account)
  end

  def new
    @account = Account.new
    respond_with(@account)
  end

  def edit
  end

  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    Stripe.api_key = ENV["STRIPE_API_KEY"]
    token = params[:stripeToken]
  
    recipient = Stripe::Recipient.create(
      :name => params[:company_name],
      :type => "corporation",
      :bank_account => token
      )
  
    @account.recipient = recipient.id

   
    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_url, notice: 'Account was successfully created.' }
        format.json { render :index, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @account.update(account_params)
    respond_with(@account)
  end

  def destroy
    @account.destroy
    respond_with(@account)
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, :recipient)
    end
    
    def check_user
      if current_user.id != @account.user_id
        redirect_to root_url, alert: "This account belongs to someone else"
      end
    end
end
