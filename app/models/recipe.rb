class Recipe < ApplicationRecord
  enum season: [:spring, :summer, :fall, :winter]
  enum main_ingredient: [:chicken, :beef, :pork, :fish, :vegetarian]

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :recipe_ingredients

  validates :name, presence: true
  validates :time, presence: true
  validates :main_ingredient, presence: true
end
