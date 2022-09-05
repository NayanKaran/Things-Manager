require_relative '../lib/classes/book'

describe Book do
  before :each do
    @book = Book.new('publisher 1', 'cover_state', '2012-01-16', true)
  end

  it 'Return a book' do
    expect(@book).to be_a_instance_of Book
  end

  it 'Book has a publisher' do
    expect(@book.publisher).to eq 'publisher 1'
  end

  it 'Book should have a cover state' do
    expect(@book.cover_state).to eq 'cover_state'
  end

  it 'Book should have a publish date' do
    expect(@book.publish_date.strftime('%Y-%m-%d')).to eq('2012-01-16')
  end

  it 'Book should not be archived' do
    expect(@book.archived).to eq true
  end

  it 'Book should have an id' do
    expect(@book.id).to be_a_kind_of Integer
  end
end
