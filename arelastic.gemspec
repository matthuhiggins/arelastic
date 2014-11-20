# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'arelastic'
  s.version = '0.6.2'
  s.summary = 'Elastic Search query builder'
  s.description = 'Build Elastic Search queries with objects'

  s.required_ruby_version     = '>= 1.9.3'
  s.required_rubygems_version = ">= 1.8.11"
  s.license     = 'MIT'

  s.author            = 'Matthew Higgins'
  s.email             = 'developer@matthewhiggins.com'
  s.homepage          = 'http://github.com/matthuhiggins/arelastic'

  s.extra_rdoc_files = ['README.rdoc']
  s.files = Dir['{lib,test}/**/*.rb']
end
