require_relative '../lib/classes/label'
describe Label do
  before :each do
    @label = Label.new('title', 'red')
  end

  it 'Return a label' do
    expect(@label).to be_a_instance_of Label
  end

  it 'Label has a title' do
    expect(@label.title).to eq 'title'
  end

  it 'Label has a color' do
    expect(@label.color).to eq 'red'
  end
end
