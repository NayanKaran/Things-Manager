require_relative '../music_album'

describe MusicAlbum do
  context 'when creating a new music album' do
    it 'should be created successfully' do
      music_album = MusicAlbum.new('The Dark Side of the Moon', 'Pink Floyd', 'Rock')
      expect(music_album.name).to eq('The Dark Side of the Moon')
      expect(music_album.label).to eq('Pink Floyd')
      expect(music_album.genre).to eq('Rock')
    end
  end

  context 'on Spotify' do
    it 'should be on Spotify' do
      music_album = MusicAlbum.new('The Dark Side of the Moon', 'Pink Floyd', 'Rock')
      expect(music_album.on_spotify).to eq(true)
    end
  end

  context 'has an id' do
    it 'should have an id' do
      music_album = MusicAlbum.new('The Dark Side of the Moon', 'Pink Floyd', 'Rock')
      expect(music_album.id).to_not be_nil
    end
  end

  context 'can be converted to JSON' do # rubocop:disable Metrics/InterpolationCheck
    it 'should be converted to JSON' do
      music_album = MusicAlbum.new('The Dark Side of the Moon', 'Pink Floyd', 'Rock')
      expect(music_album.to_json).to eq(
        '{"id":"' + music_album.id + '","name":"The Dark Side of the Moon","label":"Pink Floyd","genre":"Rock","publish_date":"' + music_album.publish_date.to_s + '","archived":false}'
      )
    end
  end
end
