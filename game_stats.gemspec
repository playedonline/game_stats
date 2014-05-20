$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "game_stats/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "game_stats"
  s.version     = GameStats::VERSION
  s.authors     = ["Chen Bauer"]
  s.email       = ["chen@funtomic.com"]
  s.homepage    = ""
  s.summary     = "game_stats gem"
  s.description = "This gem handles game stats related operations (ctr, similar games, homepage order etc) of our web apps"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.17"

  s.add_development_dependency "sqlite3"
end
