class MenuItemsController < ApplicationController
  def new
    @menu_item = MenuItem.new
    @user = current_user
  end

  def create
    @menu_item = MenuItem.new params.require(:food_name,
                                             :price,
                                             {rewards_attribute: [:food_name, :price, :id]})
    @menu_item.user = current_user
    if @menu_item.save
      redirect_to user_path(@menu_item.user), notice: "Food added successfully!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @menu_item = MenuItem.find params[:id]
    @menu_item.destroy
    redirect_to user_path(current_user), alert: "access denied" unless @menu_item.user == current_user
  end
end
