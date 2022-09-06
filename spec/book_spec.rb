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
            expect(@book.to_json).to eq("{\"id\":\"#{@book.id}\",\"title\":\"title\",\"publish_date\":\"2020-01-01\",\"archived\":false,\"publisher\":\"publisher\",\"cover_state\":\"bad\",\"label_id\":null}")
        end
    end
    describe '#move_to_archive' do
        it 'should set the archived attribute to true' do
            @book.move_to_archive
            expect(@book.archived).to be(true)
        end
    end
end
