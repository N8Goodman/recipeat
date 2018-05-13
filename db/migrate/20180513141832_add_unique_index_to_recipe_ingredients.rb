class AddUniqueIndexToRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    add_index :recipe_ingredients, [:recipe_id, :ingredient_id], unique: true
  end
end
