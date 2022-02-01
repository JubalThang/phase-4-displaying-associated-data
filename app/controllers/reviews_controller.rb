class ReviewsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  # this index is simple GET with no nested route
  # def index
  #   reviews = Review.all.order(rating: :desc)
  #   render json: reviews, only:[:username], include: {dog_house: {only: [:name, :city]}}
  # end

  # nested index route
  def index 
    if params[:dog_house_id] 
      dog_house = DogHouse.find(params[:dog_house_id])
      reviews = dog_house.reviews
    else 
      reviews = Review.all 
    end

    render json: reviews, include: :dog_house
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
