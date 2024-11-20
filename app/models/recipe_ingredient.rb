class RecipeIngredient < ApplicationRecord
  UNITS = %w{mg g kg ml l}

  belongs_to :recipe
  belongs_to :ingredient

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :unit, presence: true, inclusion: { in: UNITS }
end