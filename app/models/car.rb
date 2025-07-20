class Car < ApplicationRecord

  belongs_to :user
  has_many :calculations

  validates :car_name, :user, presence: true
  
end