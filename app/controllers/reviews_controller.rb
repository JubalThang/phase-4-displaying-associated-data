class ReviewsController < ApplicationController

  def index
    reviews = Review.all.order(rating: :desc)
    render json: reviews, only:[:username], include: {dog_house: {only: [:name, :city]}}
  end

end
