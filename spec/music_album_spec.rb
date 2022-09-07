<<<<<<< HEAD
require 'spec_helper'

describe MusicAlbum do
  album = MusicAlbum.new('2000-08-02', false)

  it 'expect album to be instance of MusicAlbum' do
    expect(album).to be_instance_of MusicAlbum
  end
  it 'expect album to be false in Spotify' do
    expect(album.on_spotify).to eq(false)
  end

  it 'expect album return false for archived value' do
    expect(album.archived).to eq(false)
  end

  it 'expect album return true after run can_be_archived method' do
    album.on_spotify = true
    album.move_to_archive

    expect(album.archived).to eq(true)
=======
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

  context 'should have a publish date' do
    it 'should have a publish date' do
      music_album = MusicAlbum.new('The Dark Side of the Moon', 'Pink Floyd', 'Rock')
      expect(music_album.publish_date).to_not be_nil
    end
  end

  context 'should have a genre' do
    it 'should have a genre' do
      music_album = MusicAlbum.new('The Dark Side of the Moon', 'Pink Floyd', 'Rock')
      expect(music_album.genre).to eq('Rock')
    end
  end

  context 'should have a label' do
    it 'should have a label' do
      music_album = MusicAlbum.new('The Dark Side of the Moon', 'Pink Floyd', 'Rock')
      expect(music_album.label).to eq('Pink Floyd')
    end
>>>>>>> dev
  end
end
