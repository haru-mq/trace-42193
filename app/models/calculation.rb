class Calculation < ApplicationRecord

  belongs_to :car
  has_many :signalinfos

end
