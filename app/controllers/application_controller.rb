class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_session_path, alert: "Please sign in"
    end
  end

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # rescue ActiveRecord::RecordNotFound
    @current_user = User.find(session[:user_id])
  end
  helper_method :current_user

  def populated_cart
    @populated_cart ||= begin
      if session[:cart]
        Cart.new(session[:cart])
      else
        nil
      end
    end
  end
  helper_method :populated_cart

  def current_cart
    session[:cart]
  end
  helper_method :current_cart

end
