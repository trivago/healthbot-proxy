namespace :healthcheck do
  desc 'Notify the healthcheck API'
  task notify: :environment do
    check = ENV["check"]
    if check.nil? || check == ""
      raise ArgumentError.new("please provide the name of a check by passing check=checkname")
    end
    puts "Calling healthcheck check: #{check}"
    HealtcheckProxyClient.ping(check)
  end
end
