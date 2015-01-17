class Tag < ActiveRecord::Base
  has_and_belongs_to_many :restaurants
  belongs_to :category
  has_and_belongs_to_many :reviews
end
