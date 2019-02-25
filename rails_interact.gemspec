$:.push File.expand_path('lib', __dir__)
require 'rails_interact/version'

Gem::Specification.new do |s|
  s.name = 'rails_interact'
  s.version = RailsInteract::VERSION
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = ''
  s.summary = 'Summary of RailsInteract.'
  s.description = 'Description of RailsInteract.'
  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_com', '~> 1.2'
  s.add_dependency 'rails_taxon', '>= 0.1'
  s.add_dependency 'rails_notice', '>= 0.1'
  s.add_development_dependency 'sqlite3'
end
