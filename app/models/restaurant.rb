class Restaurant < ActiveRecord::Base
  has_many :restaurant_categories
  has_many :categories, through: :restaurant_categories
  has_many :reviews

  validates :name, presence: true, uniqueness: true
  validates :street1, presence: true
  validates :street2, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
end
