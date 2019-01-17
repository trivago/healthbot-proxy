
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "healtcheck_proxy_client/version"

Gem::Specification.new do |spec|
  spec.name          = "healtcheck_proxy_client"
  spec.version       = HealtcheckProxyClient::VERSION
  spec.authors       = ["Hendrik Kleinwaechter"]
  spec.email         = ["hendrik.kleinwaechter@gmail.com"]

  spec.summary       = %q{This is a small ruby client for the healthbot proxy API}
  spec.description   = %q{This is a small ruby client for the healthbot proxy. Configure your API key and endpoint to get started.}
  spec.homepage      = "https://github.com/trivago/healthbot-proxy"
  spec.licenses = ['MIT']

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", '~> 0.10'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
