module HealtcheckProxyClient
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/healthcheck.rake'
    end
  end
end
