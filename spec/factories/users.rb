FactoryBot.define do

  digit_count = rand(4..125)

  factory :user do
    transient do
      gimei_name  { Gimei.name }
    end

    department_id       {rand(2..8)}
    job_num             {Faker::Number.number(digits: 8)}
    email               {Faker::Internet.email}
    password            {Faker::Alphanumeric.alpha(number: digit_count) + "1aA"}
    encrypted_password  {password}
    first_name          {gimei_name.first.kanji}
    last_name           {gimei_name.last.kanji}
    first_name_kana     {gimei_name.first.katakana}
    last_name_kana      {gimei_name.last.katakana}
  end
end
