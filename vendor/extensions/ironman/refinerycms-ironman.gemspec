# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-ironman'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Ironman extension for Refinery CMS'
  s.date              = '2014-08-08'
  s.summary           = 'Ironman extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = ['Adam George']

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 3.0.0'
  s.add_dependency             'acts_as_indexed',     '~> 0.8.0'
  s.add_dependency             'refinerycms-settings', '~> 3.0.0.dev'
  s.add_dependency             'filters_spam',         '~> 0.2'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 3.0.0'

end
