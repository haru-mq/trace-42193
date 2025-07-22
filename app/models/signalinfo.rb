class Signalinfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :calculation
  belongs_to_active_hash :signal_type

  validates :signal_name, :signal_type_id, presence: true

  validates :signal_type_id, numericality: { other_than: 1, message: "must be other than 1" }

end