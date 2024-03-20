class Destination < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes

  # Assuming you're replacing :name with :city, or you want to keep both.
  validates :city, :country, :description, presence: true
  
  validates :budget, numericality: { greater_than_or_equal_to: 0, message: "%{value} is not a valid number" }
  validates :duration, numericality: { only_integer: true, greater_than: 0, message: "%{value} must be an integer" }

  def rating
    votes.sum(:value)
  end
end
