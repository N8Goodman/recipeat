class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.integer :time, null: false
      t.integer :season
      t.boolean :favorite, null: false, default: false
      t.integer :type, null: false

      t.timestamps
    end
  end
end
