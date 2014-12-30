class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def create_stripe_recipient
    Stripe.api_key = ENV["STRIPE_API_KEY"]
      token = params[:stripeToken]
  
      recipient = Stripe::Recipient.create(
        :name => params[:company_name],
        :type => "corporation",
        :bank_account => token
        )
  
      current_user.recipient = recipient.id
      current_user.save
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end
end
