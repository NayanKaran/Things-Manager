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
  end
end
