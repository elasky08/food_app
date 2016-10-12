class HomeController < ApplicationController
  def index
    @user = User.last(4)
    @menu_item = MenuItem.last(4)
  end

  def about
  end
end
