require 'rake/clean'
require 'rspec/core/rake_task'
require 'cloudspin/stack/rake'

CLEAN.include('work')
CLOBBER.include('state')

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

namespace :stack do
  namespace 'test-network' do
    stack = Cloudspin::Stack::Rake::StackTask.new(id: 'test-network').instance

    Cloudspin::Stack::Rake::InspecTask.new(stack_instance: stack,
                                           inspec_target: 'aws://eu-west-1/assume-spin_stack_manager-skeleton')
  end
end

desc 'Create, test, and destroy the stack'
task :test => [
  :'stack:test-network:up',
  :'stack:test-network:inspec'
  # :'stack:test-network:down'
]

