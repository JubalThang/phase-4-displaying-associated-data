class ReviewsController < ApplicationController

  def index
    reviews = Review.all.order(rating: :desc)
    render json: reviews, only:[:username], include: {dog_house: {only: [:name, :city]}}
  end

  def detroy 
    review = Review.find(id: params[:id])
    if review 
      review.destroy
      header :no_content
    else
      render json: {errors: "The review is not found"} 
    end
  end

end
