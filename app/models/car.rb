class Car < ApplicationRecord

  belongs_to :user

  validates :car_name, :launch_date, :user, presence: true
  
end