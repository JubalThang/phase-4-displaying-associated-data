class ReviewsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def index
    reviews = Review.all.order(rating: :desc)
    render json: reviews, only:[:username], include: {dog_house: {only: [:name, :city]}}
  end

  def show 
    review = Review.find(params[:id])
    render json: review, status: :ok
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

  def render_not_found
    render json: {error: "No reviews"}, status: :not_found
  end

end
