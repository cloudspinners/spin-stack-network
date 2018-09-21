require 'rake/clean'
require 'cloudspin/stack/rake'
require 'cloudspin/stack/artefact'

CLEAN.include('work')
CLEAN.include('build')
CLEAN.include('dist')
CLEAN.include(
  Dir['state/**/*'].
    select { |d| File.directory? d }.
    select { |d| (Dir.entries(d) - %w[ . .. ]).empty? }
)
CLOBBER.include('state')

task :default => :dry
task :test => :inspec

include Cloudspin::Stack::Rake

network_stack = StackTask.new.instance
InspecTask.new(stack_instance: network_stack)

ArtefactTask.new(definition_folder: './src',
                 dist_folder: './dist')
