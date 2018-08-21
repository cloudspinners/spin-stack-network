
RSpec.describe 'Cloudspin::Stack::Definition' do

  let(:stack_definition) {
    Cloudspin::Stack::Definition.from_file(terraform_source_folder + '/stack.yaml')
  }

  let(:stack_instance) {
    instance = Cloudspin::Stack::Instance.new(
      stack_definition: stack_definition,
      backend_config: {},
      working_folder: working_folder,
      statefile_folder: statefile_folder
    )
    instance.add_config_from_yaml('spin-default.yaml')
    instance.add_config_from_yaml('spin-local.yaml')
    instance
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
