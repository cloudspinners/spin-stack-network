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
  File.dirname(__FILE__) + '/../src'
end
