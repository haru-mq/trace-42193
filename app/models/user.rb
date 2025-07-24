class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :department

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cars
  
  validates :job_num, :first_name, :last_name, :first_name_kana, :last_name_kana,
            presence: true

  validates :job_num,         format: { with: /\A[0-9]{8}\z/, message: "must be 8 digits" }, allow_blank: true
  
  with_options  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "must contain only full-width Japanese characters"} do
    validates :first_name
    validates :last_name
  end

  with_options  format: { with: /\A[ァ-ヶー]+\z/, message: "must be full-width katakana"} do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :password, format: {
    with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9]+\z/,
    message: "must include at least one lowercase letter, one uppercase letter, and one digit"
  }, on: :create

  validates :department_id, numericality: { other_than: 1, message: "must be other than 1" }
end
