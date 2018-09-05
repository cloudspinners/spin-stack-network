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

namespace :network do
  stack = StackTask.new(id: 'test-network').instance

  InspecTask.new(stack_instance: stack,
                 inspec_target: 'aws://eu-west-1/assume-spin_stack_manager-skeleton')
end

ArtefactTask.new(definition_folder: './src',
                 dist_folder: './dist')

desc 'Create, test, and destroy the stack'
task :test => [
  :'network:up',
  :'network:inspec',
  :'network:down'
]

namespace :pipeline do
  StackTask.new(id: 'pipeline',
                definition_folder: '../spin-stack-codepipeline/src',
                instance_folder: 'pipeline').instance
end
