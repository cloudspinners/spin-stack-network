require 'rake/clean'
require 'rspec/core/rake_task'
require 'cloudspin/stack'

CLEAN.include('work')
CLOBBER.include('state')

RSpec::Core::RakeTask.new(:spec)


task :default => :spec

def stack_definition(src_dir)
  Cloudspin::Stack::Definition.from_file(src_dir + '/stack.yaml')
end

def stack_instance_from_definition(instance_id, stack_definition_folder, stack_instance_folder)
  stack_def = stack_definition(stack_definition_folder)
  instance = Cloudspin::Stack::Instance.new(
    id: instance_id,
    stack_definition: stack_def,
    backend_config: {},
    working_folder: stack_instance_folder + '/work',
    statefile_folder: stack_instance_folder + '/state'
  )
  instance.add_config_from_yaml(stack_instance_folder + '/spin-default.yaml')
  instance.add_config_from_yaml(stack_instance_folder + '/spin-local.yaml')
  instance
end

stack_instances = []
stack_instances << stack_instance_from_definition('test-network', './src', '.')

stack_instances.each { |stack_instance|
  namespace "#{stack_instance.id}" do
    namespace :stack do

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
}
