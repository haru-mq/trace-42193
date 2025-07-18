class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :job_num, :first_name, :last_name, :first_name_kana, :last_name_kana,
            presence: true
  validates :department_id, numericality: { other_than: 1, message: "を選択してください" }
end
