require 'bundler/setup'
require 'cloudspin/stack'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def path_of_project_file(filename)
  Pathname.new(File.dirname(__FILE__) + '/../' + filename).realdirpath.to_s
end

def terraform_source_folder
  path_of_project_file('src')
end

def working_folder
  path_of_project_file('work')
end

def statefile_folder
  path_of_project_file('state')
end

