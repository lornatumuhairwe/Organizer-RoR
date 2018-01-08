class AddIndexToCategoriesTitle < ActiveRecord::Migration[5.1]
  def change
    add_index :categories, :title
  end
end
