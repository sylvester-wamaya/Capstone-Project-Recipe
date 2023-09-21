class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, :public, presence: true
  validates :preparation_time, :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
