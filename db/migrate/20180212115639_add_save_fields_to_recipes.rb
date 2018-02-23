class AddSaveFieldsToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :saved, :boolean
    add_column :recipes, :save_at, :datetime
  end
end
