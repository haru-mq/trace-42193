FactoryBot.define do
  factory :user do
    transient do
      gimei_name  { Gimei.name }
    end

    job_num         {Faker::number.digits(8)}
    first_name      {gimei_name.first.kanji}
    last_name       {gimei_name.last.kanji}
    first_name_kana {gimei_name.first.katakana}
    last_name_kana  {gimei_name.last.katakana}
    department_id   {rand(2,8)}
  end
end
