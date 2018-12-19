FactoryBot.define do
  factory :access_key do
    sequence(:token)
  end

  factory :endpoint do
    association :healthcheck
    remote_url { "https://www.foobar.com" }
    active { true}
  end

  factory :healthcheck do
    name { "A random healthcheck" }
    sequence(:slug) {|s| "slug-#{s}" }
  end

  factory :ping do
    association :endpoint
    status 0
    response "sample response"
  end
end
