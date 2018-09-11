
RSpec.describe 'Cloudspin::Stack::Definition' do

  let(:stack_definition) {
    Cloudspin::Stack::Definition.from_file(terraform_source_folder + '/stack-definition.yaml')
  }

  let(:stack_instance) {
    Cloudspin::Stack::Instance.from_files(
      'stack-instance-defaults.yaml',
      'stack-instance-local.yaml',
      stack_definition: stack_definition,
      backend_config: {},
      working_folder: working_folder,
      statefile_folder: statefile_folder
    )
  }

  describe 'plan command' do
    it 'returns a reasonable-looking plan command' do
      expect( stack_instance.plan_dry ).to match(/terraform plan -var/)
    end

    it 'runs without an error' do
      expect { stack_instance.plan }.not_to raise_error
    end
  end
end
