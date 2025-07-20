class Car < ApplicationRecord

  belongs_to :user

  validates :car_name, :user, presence: true
  
end