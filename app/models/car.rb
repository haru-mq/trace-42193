class Car < ApplicationRecord

  belongs_to :user
  has_many :calculations, dependent: :destroy
  has_paper_trail on: [:create, :update, :destroy], meta: {
    car_id: :id
  }

  validates :car_name, presence: true,
  format: { with: /\A[a-zA-Z0-9]+\z/, message: "must contain only letters and numbers"}

  validates :user, presence: true
  
end