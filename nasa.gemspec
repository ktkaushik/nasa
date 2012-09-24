# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nasa/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kaushik Thirthappa"]
  gem.email         = ["thirthappa.kaushik@gmail.com"]
  gem.description   = %q{Nasa api for ruby developers}
  gem.summary       = %q{Nasa has an api and here is how you can access it via ruby}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nasa"
  gem.require_paths = ["lib"]
  gem.version       = Nasa::VERSION
end
