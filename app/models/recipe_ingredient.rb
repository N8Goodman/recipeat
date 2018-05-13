class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  accepts_nested_attributes_for :ingredient, :reject_if => :all_blank

  validates :recipe, presence: true
  validates :ingredient, presence: true, uniqueness: { scope: :recipe }
end
