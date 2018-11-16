require 'rake/clean'
require 'cloudspin/stack/rake'
require 'cloudspin/stack/artefact'

CLEAN.include('work')
CLEAN.include('build')
CLEAN.include('dist')
CLOBBER.include('state')

include Cloudspin::Stack::Rake

stack = StackTask.new.instance
InspecTask.new(stack_instance: stack)

ArtefactTask.new(definition_folder: './src',
                 dist_folder: './dist')

task :default => :dry
task :test => :inspec

namespace :stage do
  ['ephemeral', 'apply'].each { |environment|
    namespace "#{environment}" do
      stack = StackTask.new(environment).instance
      InspecTask.new(stack_instance: stack)
    end
  }
end
