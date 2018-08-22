require 'rake/clean'
require 'rspec/core/rake_task'
require 'cloudspin/stack/rake'

CLEAN.include('work')
CLOBBER.include('state')

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

namespace :stack do
  namespace 'test-network' do
    Cloudspin::Stack::Rake::StackTask.new(id: 'test-network')
  end
end

