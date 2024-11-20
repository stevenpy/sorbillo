class AddQuantityToRecipeIngredient < ActiveRecord::Migration[7.1]
  def change
    add_column :recipe_ingredients, :quantity, :integer
  end
end
