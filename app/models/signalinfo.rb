class Signalinfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :calculation
  belongs_to_active_hash :signal_type
  has_paper_trail on: [:create, :update, :destroy], meta: {
    car_id: :car_id_from_association,
    calculation_name: ->(signalinfo) { signalinfo.calculation.calculation_name },
    signal_name: :signal_name,
    signal_type_id: :signal_type_id
  }
  
  validates :signal_name, presence: true,
  format: { with: /\A[a-zA-Z0-9]+\z/, message: "must contain only letters and numbers"}

  validates :signal_type_id, presence: true, numericality: { other_than: 1, message: "must be other than 1" }

  def car_id_from_association
    calculation.car_id
  end

end