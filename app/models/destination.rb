class Destination < ApplicationRecord
    belongs_to :user
  
 
  validates :name, :description, presence: true
  has_many :comments, dependent: :destroy

  validates :budget, numericality: { message: "%{value} is not a valid number" }
  validates :duration, numericality: { only_integer: true, message: "%{value} must be an integer" }
end
