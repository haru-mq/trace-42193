class Calculation < ApplicationRecord

  belongs_to :car
  has_many :signalinfos
  has_paper_trail on: [:create, :update, :destroy], meta: {
    car_id: :car_id,
    calculation_id: :id
  }

  validates :calculation_name, :car_id, presence: true

end
