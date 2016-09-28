class MenuItemsController < ApplicationController
  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new params.require()
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
