class MenuItemsController < ApplicationController
  def new
    @menu_item = MenuItem.new
    @user = current_user
  end

  def create
    @menu_item = MenuItem.new params.require(:menu_item).permit(:food_name,
                                             :price,
                                             :image, :description, :user_id)
    @user = User.find params[:user_id]
    @menu_item.user = @user
    respond_to do |format|
      if @menu_item.save
        flash[:notice] = "successfully added"
        format.html {redirect_to edit_user_path(@user) }
        format.js {render :create_success}
      else
        flash[:notice] = "Fix the errors!"
        format.html {render "/users/edit"}
        format.js {render :create_failure}
      end
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
    redirect_to edit_user_path(current_user), alert: "access denied" unless @menu_item.user == current_user
  end
end
