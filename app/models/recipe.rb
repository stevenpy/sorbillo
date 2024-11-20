class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :instructions, dependent: :destroy

  validates :name, presence: true
  validates :prep_time, presence: true, numericality: { greater_than: 0 }
  validates :cook_time, presence: true, numericality: { greater_than: 0 }
  validates :serving, presence: true, numericality: { greater_than: 0 }

  scope :with_ingredient, ->(ingredient_name) {
    joins(:ingredients).where('ingredients.name ILIKE ?', "%#{ingredient_name}%").distinct
  }

  def available_recipe_ingredients
    Ingredient.excluding(ingredients)
  end
end