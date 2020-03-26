FactoryBot.define do
  factory :book do
    title { Faker::Book.title }

    trait :with_publisher_name do
      publisher_name { Faker::Book.publisher }
     end
  end
end
