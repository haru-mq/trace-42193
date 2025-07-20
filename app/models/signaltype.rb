class Signaltype < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'Input' },
    { id: 3, name: 'Output' }
  ]

  include ActiveHash::Associations
  has_many :signals
end