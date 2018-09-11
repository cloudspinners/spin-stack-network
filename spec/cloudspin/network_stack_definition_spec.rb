
RSpec.describe 'network stack definition' do

  let(:stack_definition) {
    Cloudspin::Stack::Definition.from_file("#{terraform_source_folder}/stack-definition.yaml")
  }

  it 'has the right terraform source path' do
    expect(stack_definition.source_path).to eq(terraform_source_folder)
  end

end
