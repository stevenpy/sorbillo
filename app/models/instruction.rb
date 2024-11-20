class Instruction < ApplicationRecord
  belongs_to :recipe
  
  validates :steps_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true
end