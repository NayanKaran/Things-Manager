require_relative '../lib/classes/game'

describe Game do
  context 'Recently Played Multi Player Game - Less than 10 Years Old' do
    before :each do
      @game_one = Game.new(true, '2021-11-03', '2018-05-25', false)
    end

    it 'Expects game to be instance of Game class' do
      expect(@game_one).to be_instance_of Game
    end

    it 'Expects game to be a multiplayer game' do
      expect(@game_one.multiplayer).to eq(true)
    end

    it 'Expects game not to be archived' do
      expect(@game_one.archived).to eq(false)
    end

    it 'Expects game played within 2 years and less than 10 year old not to be archivable' do
      archivable = @game_one.send(:can_be_archived?)
      expect(archivable).to eq(false)
    end
  end

  context 'Recently Played Single Player Game - More than 10 Years Old' do
    before :each do
      @game_two = Game.new(false, '2022-08-02', '2010-01-05', false)
    end

    it 'Expects game not to be a multiplayer game' do
      expect(@game_two.multiplayer).to eq(false)
    end

    it 'Expects game not to be archived' do
      expect(@game_two.archived).to eq(false)
    end

    it 'Expects game played within 2 years not to be archivable' do
      archivable = @game_two.send(:can_be_archived?)
      expect(archivable).to eq(false)
    end
  end

  context 'Single Player Game - Not recently played - More than 10 years old' do
    before :each do
      @game_three = Game.new(false, '2016-07-17', '2010-01-05', false)
    end

    it 'Expects game not played within 2 years and older than 10 years to be archivable' do
      archivable = @game_three.send(:can_be_archived?)
      expect(archivable).to eq(true)
    end

    it 'Expects to be archived when moved to archive' do
      @game_three.move_to_archive
      expect(@game_three.archived).to eq(true)
    end
  end
end
