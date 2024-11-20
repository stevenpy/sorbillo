class AddUnitToRecipeIngredient < ActiveRecord::Migration[7.1]
  def change
    add_column :recipe_ingredients, :unit, :string
  end
end
