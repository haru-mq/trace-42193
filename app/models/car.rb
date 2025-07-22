class Car < ApplicationRecord

  belongs_to :user
  has_many :calculations
  has_paper_trail on: [:create, :update, :destroy]

  validates :car_name, :user, presence: true
  
end