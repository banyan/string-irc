# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Kohei Hasegawa"]
  gem.email         = ["ameutau@gmail.com"]
  gem.description   = %q{add color codes for mIRC compatible client}
  gem.summary       = %q{add color codes for mIRC compatible client}
  gem.homepage      = %q{http://github.com/banyan/string-irc}
  gem.date          = %q{2012-04-12}
  gem.licenses      = [%q{MIT}]

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "string-irc"
  gem.require_paths = ["lib"]
  gem.version       = "0.3.0"

  # dependencies
  gem.add_runtime_dependency     "net-irc", ">= 0.0.9"
  gem.add_development_dependency "rspec",   ">= 2.11.0"
  gem.add_development_dependency 'rake',    '>= 0.9.2.2' # need for Travis CI
  gem.add_development_dependency 'rdoc',    '>= 3.11'    # need for Travis CI
end
