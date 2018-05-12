class RenameRecipesTypeToMainIngredient < ActiveRecord::Migration[5.0]
  def change
    rename_column :recipes, :type, :main_ingredient
  end
end
