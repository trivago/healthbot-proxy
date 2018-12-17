if Rails.env.development? || Rails.env.test?
  require "factory_bot"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryBot::Syntax::Methods

      key = create(:access_key)
      puts "API Key created. Token: #{key.token}"
    end
  end
end

