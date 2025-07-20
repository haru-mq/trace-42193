class Signalinfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :calculation
  belongs_to_active_hash :signal_type

end