require 'rake/clean'
require 'rspec/core/rake_task'
require 'cloudspin/stack'

CLEAN.include('work')
CLOBBER.include('state')

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

stack_instance = Cloudspin::Stack::Instance.from_definition_folder(id: 'test-network', definition_folder: './src', instance_folder: '.')
stack_instance.add_config_from_yaml('./spin-default.yaml')
stack_instance.add_config_from_yaml('./spin-local.yaml')

namespace :stack do
  namespace "#{stack_instance.id}" do

    desc "Create or update stack #{stack_instance.id}"
    task :up do
      puts stack_instance.up_dry
      puts stack_instance.up
    end

    desc "Plan changes to stack #{stack_instance.id}"
    task :plan do
      puts stack_instance.plan_dry
      puts stack_instance.plan
    end

    desc "Show command line to be run for stack #{stack_instance.id}"
    task :dry do
      puts stack_instance.up_dry
    end

    desc "Destroy stack #{stack_instance.id}"
    task :down do
      puts stack_instance.down_dry
      puts stack_instance.down
    end

  end
end
