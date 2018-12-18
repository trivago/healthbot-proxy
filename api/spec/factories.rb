FactoryBot.define do
  factory :healthcheck do
    name "A random healthcheck"
  end
  factory :access_key do
    sequence(:token)
  end
end
