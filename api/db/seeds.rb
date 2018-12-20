require 'factory_bot_rails'

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
