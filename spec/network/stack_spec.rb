
RSpec.describe 'Cloudspin::Stack::Definition' do

  before(:all) do
    @instance_identifier = 'spec_env'
    @component = 'spec_component'
    @estate = 'spec_estate'
    @base_dns_domain = 'spec_dns_domain'

    stack_definition = Cloudspin::Stack::Definition.from_file(terraform_source_folder + '/stack-definition.yaml')

    instance = Cloudspin::Stack::Instance.new(
      stack_definition: stack_definition,
      backend_config: {},
      working_folder: working_folder,
      statefile_folder: statefile_folder
    )
    instance.add_config_from_yaml('spin-local.yaml')
    instance.add_parameter_values(
      {
        :instance_identifier => @instance_identifier,
        :component => @component,
        :estate => @estate,
        :base_dns_domain => @base_dns_domain
      }
    )

    @stack_instance = instance
    @stack_instance.up
  end

  after(:all) do
    @stack_instance.down
  end

end
