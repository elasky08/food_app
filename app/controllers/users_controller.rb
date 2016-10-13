class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :update]
  before_action :authorize!, only: [:destroy, :update, :edit]
  PROJECTS_PER_PAGE = 10
  def new
    @user = User.new

  end

  def create
    @user = User.new params.require(:user).permit([:first_name, :last_name, :email, :apartment_number, :street_number, :street, :city, :state, :telephone, :country, :shop_name, :description, :password, :password_confirmation, :avatar])
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
    @order = Order.new
  end

  def index
    @q = User.ransack(params[:q])
    if params[:q]
      @users2 = @q.result
    else
      @users2 = User.where.not(shop_name: nil).order(created_at: :desc).
                                                  page(params[:page]).
                                                  per(PROJECTS_PER_PAGE)
    end

    # if params[:lat]
    #   @users2 = User.near([params[:lat], params[:lng]], 50, units: :km)
    # else
    #   @users2 = User.where.not(latitude: nil, longitude: nil).order(:created_at).limit(30)
    # end
    @markers = Gmaps4rails.build_markers(@users2.with_lat_and_lng) do |user, marker|
      marker.lat  user.latitude
      marker.lng  user.longitude
      marker.infowindow  user.first_name
    end
  end

  def edit
    @user = User.find params[:id]
    # @user.edit params.require(:user).permit([:first_name, :last_name, :email, :apartment_number, :street_number, :street, :city, :state, :telephone, :country, :shop_name, :description, :password, :password_confirmation, :avatar, {menu_items_attributes: [:food_name, :price, :destroy, :id]}])

    @menu_items = MenuItem.new
  end

  def update
    @user = User.find params[:id]
    if @user.update params.require(:user).permit([:first_name, :last_name, :email, :apartment_number, :street_number, :street, :city, :state, :telephone, :country, :shop_name, :description, :password, :password_confirmation, :avatar, {menu_items_attributes: [:food_name, :price, :destroy, :id]}])
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
    @user = User.find params[:id]
    redirect_to root_path, alert: "access denied!" unless @user == current_user
  end

end
