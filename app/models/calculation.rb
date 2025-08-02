class Calculation < ApplicationRecord

  belongs_to :car
  has_many :signalinfos, dependent: :destroy
  has_paper_trail on: [:create, :update, :destroy], meta: {
    car_id: :car_id,
    calculation_id: :id
  }

  validates :calculation_name, presence: true,
  format: { with: /\A[a-zA-Z0-9]+\z/, message: "must contain only letters and numbers"}
  
  validates :car_id, presence: true

end