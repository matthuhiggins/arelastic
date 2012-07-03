# -*- encoding: utf-8 -*-
 
Gem::Specification.new do |s|
  s.name = 'arelastic'
  s.version = '0.0.1'
  s.summary = 'Elastic Search query builder'
  s.description = 'Build Elastic Search queries with objects'

  s.required_ruby_version     = '>= 1.9.2'
  s.required_rubygems_version = '>= 1.3.5'

  s.author            = 'Matthew Higgins'
  s.email             = 'developer@matthewhiggins.com'
  s.homepage          = 'http://github.com/matthuhiggins/arelastic'

  s.extra_rdoc_files = ['README.rdoc']
  s.files = %w(MIT-LICENSE Rakefile README.rdoc) + Dir['{lib,test}/**/*.rb']
  # s.require_path = 'lib'
end