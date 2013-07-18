FactoryGirl.define do
  factory :user do
    username { Faker::Name.first_name }
    password 'password'
  end

  factory :crush do
    url { Faker::Internet.domain_name }
    description { Faker::Lorem.paragraph(1) }
    user
  end

  factory :crush_with_votes, :parent => :crush do
    after(:create) do |c|
      3.times {
        create(:vote, [:up, :down].sample, :crush => c)
      }
    end
  end

  factory :vote do
    user
    crush

    trait :up do
      up true
    end

    trait :down do
      up false
    end

  end
end
