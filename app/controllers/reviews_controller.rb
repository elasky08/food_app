class ReviewsController < ApplicationController
  def create
    @review = Review.new params.require(:review).permit(:body)
  end

  def destroy
  end

end
