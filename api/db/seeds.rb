require 'factory_bot_rails'

def seed_data(msg)
  puts "=============== #{msg} ==============="
  yield
end

token = Rails.env.development? ? '1' : SecureRandom.hex(3)
seed_data("access key") do
  FactoryBot.create(:access_key, token: token, active: true)
end

password = Rails.env.development? ? 'password' : SecureRandom.hex(20)
seed_data("active admin user") do
  AdminUser.create!(
    email: 'admin@example.com',
    password: password,
    password_confirmation: password
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

seed_data("Access information") do
  puts "Use the following information to access the site:"
  puts "EMAIl: admin@example.com"
  puts "PASSWORD: #{password}"
  puts "TOKEN: #{token}"
end
