class Calculation < ApplicationRecord

  belongs_to :car
  has_many :signalinfos

  validates :calculation_name, :car_id, presence: true

end
