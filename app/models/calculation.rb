class Calculation < ApplicationRecord

  belongs_to :car
  has_many :signalinfos
  has_paper_trail on: [:create, :update, :destroy]

  validates :calculation_name, :car_id, presence: true

end
