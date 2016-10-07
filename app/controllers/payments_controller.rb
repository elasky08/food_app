class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.find params[:order_id]
  end

  def create
    order = Order.find params[:order_id]
  end
end
