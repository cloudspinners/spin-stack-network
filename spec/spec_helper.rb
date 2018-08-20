require 'bundler/setup'
require 'cloudspin/stack'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def terraform_source_folder
  Pathname.new(File.dirname(__FILE__) + '/../src').realpath.to_s
end

def working_folder
  Pathname.new(File.dirname(__FILE__) + '/../work').realpath.to_s
end

def statefile_folder
  Pathname.new(File.dirname(__FILE__) + '/../state').realpath.to_s
end

def assume_role_arn
  configuration['assume_role_arn']
end

def configuration
  @config ||= load_config
end

def load_config
  default_config.merge(local_config)
end

def local_config
  YAML.load_file(File.dirname(__FILE__) + '/../spin-local.yaml') || {}
end

def default_config
  YAML.load_file(File.dirname(__FILE__) + '/../spin-default.yaml') || {}
end

