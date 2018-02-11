class AddFieldToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :difficulty, :string
    add_column :recipes, :time, :string
  end
end
