class DogHouse < ApplicationRecord
  # dependent: :destory will delet all records that associated with the parent record is destoryed 
  has_many :reviews, dependent: :destroy 
end
