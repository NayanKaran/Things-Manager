<<<<<<< HEAD
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
=======
require_relative '../book'

describe Book do
  before(:all) do
    @book = Book.new('publisher', 'bad', '2020-01-01', 'title')
  end
  it 'should be an instance of Book' do
    expect(@book).to be_an_instance_of(Book)
  end
  it 'should have a publisher' do
    expect(@book.publisher).to eq('publisher')
  end
  it 'should have a cover state' do
    expect(@book.cover_state).to eq('bad')
  end
  it 'should have a publish date' do
    expect(@book.publish_date).to eq('2020-01-01')
  end
  it 'should not be archived' do
    expect(@book.archived).to be(false)
  end
  describe '#can_be_archived?' do
    it 'should return true if the book is older than 10 years' do
      @book = Book.new('publisher', 'good', '2010-01-01', 'title')
      expect(@book.send(:can_be_archived?)).to be(true)
    end
    it 'should return true if the book has a bad cover state' do
      @book = Book.new('publisher', 'bad', '2020-01-01', 'title')
      expect(@book.send(:can_be_archived?)).to be(true)
    end
    it 'should return false if the book is younger than 10 years and has a good cover state' do
      @book = Book.new('publisher', 'good', '2020-01-01', 'title')
      expect(@book.send(:can_be_archived?)).to be(false)
    end
  end
  describe '#to_json' do
    it 'should return a json representation of the book' do
      expect(@book.to_json).to eq("{\"id\":\"#{@book.id}\",\"title\":\"title\"," \
                                  '"publish_date":"2020-01-01",' \
                                  '"archived":false,"publisher":"publisher",' \
                                  '"cover_state":"bad","label_id":null}')
    end
  end
  describe '#move_to_archive' do
    it 'should set the archived attribute to true' do
      @book.move_to_archive
      expect(@book.archived).to be(true)
    end
>>>>>>> dev
  end
end
