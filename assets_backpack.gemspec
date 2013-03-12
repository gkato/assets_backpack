$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "assets_backpack/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "assets_backpack"
  s.version     = AssetsBackpack::VERSION
  s.authors     = ["Guilherme Kato"]
  s.email       = ["guilherme.kato@gmail.com.br"]
  s.homepage    = ""
  s.summary     = %q{A Ruby/Rails syntax for asset local storaging}
  s.description = %q{Helps you to avoid http requests by storing some assets into the browser's local storage,
                    if supported of course}

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  #s.test_files = Dir["test/**/*"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
