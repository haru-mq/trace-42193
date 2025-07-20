class Signalinfo < ApplicationRecord

  belongs_to :calculation

  validates :signal_name, :signal_type_id, :calculation, presence: true

end