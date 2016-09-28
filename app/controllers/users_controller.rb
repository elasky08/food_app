class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit!
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thanks for signing up"
    else
      flash[:alert] = "fix errors below"
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def index
    @users = User.all.where.not(shop_name: nil).order(created_at: :desc).
                                                page(params[:page]).
                                                per(10)
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update params.require(:user).permit!
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
  end

end
