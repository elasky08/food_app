class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    # @user = User.find params[:id]
    review = Review.find params[:review_id]
    like     = Like.new user: current_user, review: review
    if !(can? :like, review)
      redirect_to root_path, alert: "access denied"
    elsif like.save
      # redirect_to(question_path(question), {notice: "Thanks for liking"})
      redirect_to user_path(@user), notice: "Thanks for liking"
    else
      redirect_to user_path(@user), alert: like.errors.full_messages.join(", ")
    end
  end

  def destroy
    @user = User.find params[:id]
    review = Review.find params[:review_id]
    like     = Like.find params[:id]
    if can? :destroy, like
      like.destroy
      redirect_to user_path(@user), notice: "Like removed!"
    else
      redirect_to root_path, alert: "access denied!"
    end
  end
end
