class Review < ActiveRecord::Base
  belongs_to :restaurant

  validates :rating,
    presence: true,
    numericality: { only_integer: true },
    inclusion: { in: 1..5 }
  validates :description, presence: true
end
