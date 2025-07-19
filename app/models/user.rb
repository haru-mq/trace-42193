class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :job_num, :first_name, :last_name, :first_name_kana, :last_name_kana,
            presence: true

  validates :job_num,         format: { with: /\A[0-9]{8}+\z/, message: "8桁の数字を入力してください" }
  
  with_options  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "を入力してください"} do
    validates :first_name
    validates :last_name
  end
  with_options  format: { with: /\A[ァ-ヶー]+\z/, message: "を入力してください"} do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :department_id, numericality: { other_than: 1, message: "を選択してください" }
end
