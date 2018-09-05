
RSpec.describe 'network stack definition' do

  let(:stack_definition) {
    Cloudspin::Stack::Definition.from_file("#{terraform_source_folder}/stack-definition.yaml")
  }

  it 'has the right terraform source path' do
    expect(stack_definition.terraform_source_path).to eq(terraform_source_folder)
  end

  it 'has the instance parameter names defined in the yaml file' do
    expect(stack_definition.parameter_names).to contain_exactly(
      'deployment_identifier',
      'base_dns_domain'
    )
  end

  it 'has the required resource names defined in the yaml file' do
    expect(stack_definition.resource_names).to contain_exactly(
      'aws_profile',
      'assume_role_arn',
      'region',
      'availability_zones'
    )
  end

end
