
RSpec.describe 'network stack instance management' do

  let(:stack_definition) {
    Cloudspin::Stack::Definition.from_file(terraform_source_folder + '/stack.yaml')
  }

  let(:stack_instance) {
    Cloudspin::Stack::Instance.new(
      stack_definition: stack_definition,
      backend_config: {},
      working_folder: working_folder,
      statefile_folder: statefile_folder
    )
  }

  it 'is planned without error' do
    expect { stack_instance.plan }.not_to raise_error
  end

  it 'returns a reasonable-looking plan command' do
    expect( stack_instance.plan_command ).to match(/terraform plan -var/)
  end

end
