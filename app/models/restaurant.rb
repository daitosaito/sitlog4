class Restaurant < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :tags
  belongs_to :user
  has_many :reviews

  validates :name, presence: true
  validates :area, presence: true
end
