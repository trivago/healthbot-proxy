require 'factory_bot_rails'

def seed_data(msg)
  puts "=============== #{msg} ==============="
  yield
end

seed_data("access key") do
  FactoryBot.create(:access_key)
end

