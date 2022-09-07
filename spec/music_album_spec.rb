require_relative '../music_album'

describe MusicAlbum do
  context 'when creating a new music album' do
    let(:music_album) { MusicAlbum.new('Bright', '200', 'Artist 1', '10', 'Sony', 'Pop') }
    it 'should have an id' do
      expect(music_album.id).to_not be_nil
    end
    it 'should have a name' do
      expect(music_album.name).to eq('Bright')
    end
    it 'should have a price' do
      expect(music_album.price).to eq('200')
    end
    it 'should have an artist' do
      expect(music_album.artist).to eq('Artist 1')
    end
    it 'should have tracks' do
      expect(music_album.tracks).to eq('10')
    end
    it 'should have a label' do
      expect(music_album.label).to eq('Sony')
    end
    it 'should have a genre' do
      expect(music_album.genre).to eq('Pop')
    end
    it 'should have a publish date' do
      expect(music_album.publish_date).to_not be_nil
    end
    it 'should not be archived' do
      expect(music_album.archived).to be false
    end
  end
end
