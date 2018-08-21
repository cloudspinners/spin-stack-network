
RSpec.describe 'network stack instance management' do

  let(:stack_definition) {
    Cloudspin::Stack::Definition.from_file(terraform_source_folder + '/stack.yaml')
  }

  let(:parameter_values) {
    {
      'deployment_identifier' => 'my_env',
      'component' => 'my_component',
      'estate' => 'my_estate',
      'base_dns_domain' => 'my_domain'
    }
  }

  let(:resource_values) {
    {
      'assume_role_arn' => assume_role_arn
    }
  }

  let(:stack_instance) {
    Cloudspin::Stack::Instance.new(
      stack_definition: stack_definition,
      backend_config: {},
      working_folder: working_folder,
      statefile_folder: statefile_folder,
      parameter_values: parameter_values,
      resource_values: resource_values
    )
  }


  it 'is planned without error' do
    expect { stack_instance.plan }.not_to raise_error
  end

  it 'returns a reasonable-looking plan command' do
    expect( stack_instance.plan_command ).to match(/terraform plan -var/)
  end

end
