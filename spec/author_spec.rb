require_relative '../author'
require './game'
require 'yaml'

describe Author do
  before :all do
    @author = Author.new('sanja', 'mandic')
  end

  describe '#new' do
    it 'returns a new author object' do
      expect(@author).to be_an_instance_of Author
    end
    it 'throws an ArgumentError when given fewer than 2 parameters' do
      expect { Author.new('sanja') }.to raise_exception ArgumentError
    end
  end

  describe '#first_name' do
    it 'returns the correct first_name' do
      expect(@author.first_name).to eql 'sanja'
    end
  end

  describe '#last_name' do
    it 'returns the correct last_name' do
      expect(@author.last_name).to eql 'mandic'
    end
  end

  describe '#items' do
    it 'returns the correct items' do
      expect(@author.items).to eql []
      game = Game.new('sss', '01/01/2018', '01/01/2018')
      @author.add_item(game)
      expect(@author.items).to eql [game]
      expect(game.author).to eql @author
    end
  end
end
