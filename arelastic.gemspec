# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'arelastic'
  s.version = '3.3.0'
  s.summary = 'Elastic Search query builder'
  s.description = 'Build Elastic Search queries with objects'

  s.required_ruby_version     = '>= 2.4.0'
  s.license                   = 'MIT'

  s.author            = 'Matthew Higgins'
  s.email             = 'developer@matthewhiggins.com'
  s.homepage          = 'http://github.com/matthuhiggins/arelastic'

  s.extra_rdoc_files = ['README.md']
  s.files = Dir['{lib,test}/**/*.rb']
end
