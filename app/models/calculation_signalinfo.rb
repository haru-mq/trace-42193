class CalculationSignalinfo
  include ActiveModel::Model
  attr_accessor :calculation_name, :signal_name, :signal_type_id, :car_id

  validates :signal_name, :signal_type_id, presence: true

  validates :signal_type_id, numericality: { other_than: 1, message: "must be other than 1" }

  def save
    calculation = Calculation.create(calculation_name: calculation_name, car_id: car_id)
    Signalinfo.create(signal_name: signal_name, signal_type_id: signal_type_id, calculation_id: calculation.id)
  end
end