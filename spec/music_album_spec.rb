require_relative '../music_album'

describe MusicAlbum do
  context 'when creating a new music album' do
    it 'should be created successfully' do
      label = double('Label')
      genre = double('Genre')
      music_album = MusicAlbum.new(label, genre)
      expect(music_album).to be_a(MusicAlbum)
    end
  end

  context 'on Spotify' do
    it 'should be on Spotify' do
      label = double('Label')
      genre = double('Genre')
      music_album = MusicAlbum.new(label, genre)
      expect(music_album.on_spotify).to be(true)
    end
  end

  context 'has an id' do
    it 'should have an id' do
      label = double('Label')
      genre = double('Genre')
      music_album = MusicAlbum.new(label, genre)
      expect(music_album.id).to_not be(nil)
    end
  end

  context 'should have a publish date' do
    it 'should have a publish date' do
      label = double('Label')
      genre = double('Genre')
      music_album = MusicAlbum.new(label, genre)
      expect(music_album.publish_date).to_not be(nil)
    end
  end

  context 'should have a genre' do
    it 'should have a genre' do
      label = double('Label')
      genre = double('Genre')
      music_album = MusicAlbum.new(label, genre)
      expect(music_album.genre).to_not be(nil)
    end
  end

  context 'should have a label' do
    it 'should have a label' do
      label = double('Label')
      genre = double('Genre')
      music_album = MusicAlbum.new(label, genre)
      expect(music_album.label).to_not be(nil)
    end
  end
end
