require_relative 'music_album'

describe MusicAlbum do
  context 'when testing the MusicAlbum class' do
    it 'should create an instance of MusicAlbum' do
      expect(MusicAlbum.new).to be_an_instance_of MusicAlbum
    end
  end
  
  context 'when initializing' do
    it 'should have a name, price, artist, and tracks' do
      album = MusicAlbum.new('The Dark Side of the Moon', 10, 'Pink Floyd', 10)
      expect(album.name).to eq('The Dark Side of the Moon')
      expect(album.price).to eq(10)
      expect(album.artist).to eq('Pink Floyd')
      expect(album.tracks).to eq(10)
    end
  end

  context 'when checking if on spotify' do
    it 'should return true' do
      album = MusicAlbum.new('The Dark Side of the Moon', 10, 'Pink Floyd', 10)
      expect(album.on_spotify).to eq(true)
    end
  end

  context 'when checking if can be archived' do
    it 'should return true if on spotify' do
      album = MusicAlbum.new('The Dark Side of the Moon', 10, 'Pink Floyd', 10)
      expect(album.can_be_archived).to eq(true)
    end
  end

end