FactoryBot.define do
  factory :car do
    car_name        {Faker::Commerce.product_name()}
    launch_date     {Faker::Date.forward(days: 3650)}

    association :user
  end
end