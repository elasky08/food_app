class MenuItemsController < ApplicationController
  def new
    @menu_item = MenuItem.new
    @user = current_user
  end

  def create
    @menu_item = MenuItem.new params.require(:menu_item).permit!
    @menu_item.user = current_user
    if @menu_item.save
      redirect_to user_show_path(@user), notice: "Food added successfully!"
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
    menu_item = MenuItem.find params[:id]
    campaign.destroy
  end
end
