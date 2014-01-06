# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    name { Faker::Company.bs }
    opponent { Faker::Company.name }
    opponent_url { Faker::Internet.domain_name }

    user
  end
end
