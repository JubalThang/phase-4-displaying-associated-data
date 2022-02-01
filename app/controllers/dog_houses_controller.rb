class DogHousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index 
    render json: DogHouse.all
  end

  # command out review and review_index 
  # def reviews_index 
  #   dog_house = DogHouse.find(params[:dog_house_id])
  #   reviews = dog_house.reviews
  #   render json: reviews, include: :dog_house
  # end

  # def review 
  #   review = Review.find(params[:id])
  #   render json: review, include: :dog_house
  # end

  def show
    dog_house = DogHouse.find(params[:id])
    render json: dog_house, include: :reviews
  end

  def destroy
    dog_house = DogHouse.find(params[:id])
    dog_house.destroy
    head :no_content
  end

  private

  def render_not_found_response
    render json: { error: "Dog house not found" }, status: :not_found
  end

end
