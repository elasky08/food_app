class CartsController < ApplicationController
  def show
    if session[:cart]
      @cart = session[:cart]
    else
      @cart = {}
    end
    render :show
  end
  alias_method :edit, :show

  def add
    id = params[:id]
    if session[:cart]
      session[:cart][id] += 1
    else
      session[:cart] = Hash.new(0)
    end
    redirect_to edit_cart_path
  end

  def update
  end

  def destroy
    clear
    redirect_to :action => :index
  end

  private

  def clear
    session[:cart] = nil
  end


end
