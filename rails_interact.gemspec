$:.push File.expand_path('lib', __dir__)
require 'rails_interact/version'

Gem::Specification.new do |spec|
  spec.name = 'rails_interact'
  spec.version = RailsInteract::VERSION
  spec.authors = ['qinmingyuan']
  spec.email = ['mingyuan0715@foxmail.com']
  spec.homepage = ''
  spec.summary = 'Summary of RailsInteract.'
  spec.description = 'Description of RailsInteract.'
  spec.license = 'MIT'

  spec.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.md'
  ]

  spec.add_dependency 'rails_com', '~> 1.2'
  spec.add_development_dependency 'sqlite3'
end
