require_relative '../lib/classes/author'
describe Author do
  before :each do
    @author = Author.new('John', 'Newman')
  end

  it 'Return a author' do
    expect(@author).to be_a_instance_of Author
  end

  it 'Label has a name' do
    expect(@author.name).to eq 'John'
  end

  it 'Label has a last name' do
    expect(@author.last_name).to eq 'Newman'
  end
end
