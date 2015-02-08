source 'https://rubygems.org'

group :test do
  gem 'rake'
  gem 'puppet', ENV['PUPPET_VERSION'] || '~> 3.7.0'
  gem 'rspec-puppet', :git => 'git@github.com:ssm/rspec-puppet.git', :ref => 'feature/rspec3'
  gem 'puppetlabs_spec_helper'
end

group :development do
  gem 'travis'
  gem 'travis-lint'
  gem 'vagrant-wrapper'
  gem 'puppet-blacksmith'
  gem 'guard-rake'
  gem 'metadata-json-lint'
end
