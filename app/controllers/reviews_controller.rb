class ReviewsController < ApplicationController
  def create
    @review = Review.new params.require(:review).permit(:body)
    @user = User.find params[:user_id]
    @review.user = @user

    if @review.save
      redirect_to user_path(@user), notice: "review created!"
    else
      render "users/show", notice: "Error"
    end
  end

  def show
    @review = Review.find params[:id]
  end

  def destroy
  end

end
