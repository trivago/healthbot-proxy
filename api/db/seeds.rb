require 'factory_bot_rails'
c
def seed_data(msg)
  puts "=============== #{msg} ==============="
  yield
end

seed_data("access key") do
  FactoryBot.create(:access_key)
end

seed_data("active admin user") do
  AdminUser.create!(
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
  )
end

seed_data("create healtchecks") do
  5.times { FactoryBot.create(:healthcheck) }
end

seed_data("create endpoints") do
  Healthcheck.find_each do |h|
    (1..5).to_a.sample.times do
      FactoryBot.create(:endpoint, healthcheck: h)
    end
  end
end

seed_data("endpoint pings") do
  Endpoint.find_each do |e|
    (1..5).to_a.sample.times do
      FactoryBot.create(:ping, endpoint: e)
    end
  end
end
