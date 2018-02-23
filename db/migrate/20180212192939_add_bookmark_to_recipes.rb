class AddBookmarkToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :day_bookmark, :boolean
  end
end
