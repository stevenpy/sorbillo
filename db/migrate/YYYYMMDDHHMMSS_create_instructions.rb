class CreateInstructions < ActiveRecord::Migration[6.1]
  def change
    create_table :instructions do |t|
      t.integer :steps_number
      t.text :description
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end