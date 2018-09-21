require 'rake/clean'
require 'rspec/core/rake_task'
require 'cloudspin/stack/rake'
require 'cloudspin/stack/artefact'

CLEAN.include('work')
CLEAN.include('build')
CLEAN.include('dist')
CLOBBER.include('state')

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

include Cloudspin::Stack::Rake

['sandbox', 'test', 'staging'].each { |environment|
  namespace "#{environment}" do
    namespace :network do
      network_stack = StackTask.new(environment).instance
      InspecTask.new(stack_instance: network_stack)
    end
  end
}

ArtefactTask.new(definition_folder: './src',
                 dist_folder: './dist')

desc 'Dry run for the sandbox instance'
task :dry => [ 'sandbox:network:dry' ]
desc 'Plan the sandbox instance'
task :plan => [ 'sandbox:network:plan' ]
desc 'Create or update the sandbox instance'
task :up => [ 'sandbox:network:up' ]
desc 'Destroy the sandbox instance'
task :down => [ 'sandbox:network:down' ]
desc 'Test the sandbox instance'
task :test => [ 'sandbox:network:inspec' ]
