class Destination < ApplicationRecord
    belongs_to :user
  
 
  validates :name, :description, presence: true
  has_many :comments, dependent: :destroy
end
