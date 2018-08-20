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
