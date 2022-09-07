<<<<<<< HEAD
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
=======
require_relative '../label'

describe Label do
  before(:all) do
    @label = Label.new('label', 'red')
  end
  it 'should be an instance of Label' do
    expect(@label).to be_an_instance_of(Label)
  end
  it 'should have a title' do
    expect(@label.title).to eq('label')
  end
  it 'should have a color' do
    expect(@label.color).to eq('red')
  end
  it 'should have an id' do
    expect(@label.id).to_not be_nil
  end
  describe '#add_item' do
    it 'should add an item to the label' do
      @item = Item.new('2020-01-01')
      @label.add_item(@item)
      expect(@label.instance_variable_get(:@items)).to include(@item)
    end
  end
  describe '#to_json' do
    it 'should return a json representation of the label' do
      expect(@label.to_json).to eq("{\"id\":\"#{@label.id}\",\"title\":\"label\",\"color\":\"red\"}")
    end
>>>>>>> dev
  end
end
