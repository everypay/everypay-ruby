# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

Gem::Specification.new do |s|
  s.name        = 'everypay'
  s.version     = '1.0.0'
  s.date        = '2015-10-21'
  s.summary     = 'Everypay api library for ruby.'
  s.description = 'Everypay payment gateway. See https://www.everypay.gr for details.'
  s.authors     = ['Andreas Kollaros']
  s.email       = 'akl@everypay.gr'
  s.homepage    = 'https://www.everypay.gr/api'
  s.license     = 'MIT'

  s.add_dependency('rest-client', '~> 1.8')
  s.add_dependency('json', '~> 1.8.3')

  s.add_development_dependency('mocha', '~> 1.1')
  s.add_development_dependency('test-unit')
  s.add_development_dependency('rake')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ['lib']
end
