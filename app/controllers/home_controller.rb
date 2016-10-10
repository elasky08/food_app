class HomeController < ApplicationController
  def index
    @user = User.last(5)
    @menu_item = MenuItem.last(5)
  end

  def about
  end
end
