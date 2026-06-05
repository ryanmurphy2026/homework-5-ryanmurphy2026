class AddCategoryToTodos < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :category, :string, null: false, default: "personal"
  end
end
