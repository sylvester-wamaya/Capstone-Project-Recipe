class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  belongs_to :user

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
