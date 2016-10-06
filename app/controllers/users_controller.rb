class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :update]
  before_action :authorize!, only: [:destroy, :update, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit!
    if @user.save
      session[:user_id] = @user.id
      if @user.user_type == true
        redirect_to
      else
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Logged in!"
      end
    else
      flash[:alert] = "fix errors below"
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    # @user2 = User.search(params[:search])
    @review = @user.reviews.new
  end

  def index
    @users2 = User.search(params[:search])
    if params[:search]
      @users = User.where(id:[5..8])
    else
      @users = User.all.where.not(shop_name: nil).order(created_at: :desc).
                                                  page(params[:page]).
                                                  per(10)
    end
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

  def search
    byebug
    if params[:search]
      query = "%#{params[:search]}%"
      @users = User.where("shop_name ILIKE :search OR apartment_number :search OR street_number :search OR street :search OR city :search OR state :search OR country :search OR telephone :search_term", {search: query})
    else
      @users = User.all
    end
      render :index
  end

  private

  def authorize!
    redirect_to root_path, alert: "access denied!" unless @user == current_user
  end

end
