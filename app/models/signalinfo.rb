class Signalinfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :calculation

  validates :signal_name, :calculation, presence: true

  validates :signal_type_id, numericality: { other_than: 1, message: "must be other than 1" }
end