class Calculation < ApplicationRecord

  belongs_to :car
  has_many :signals

  validates :calculation_name, :car, presence: true

end
