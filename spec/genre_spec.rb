require 'spec_helper'

describe Genre do
  album = Genre.new('Rock')
  item = MusicAlbum.new('2020-05-16', true)

  it 'expect album to be instance of Genre' do
    expect(album).to be_instance_of Genre
  end

  it 'expect add_items to add item in items array' do
    album.add_item(item)

    expect(album.items.length).to eq(1)
  end

  it 'expect item genre to be equal album' do
    expect(item.genre).to eq(album)
  end

  it 'expect add_items to add item in items array' do
    item2 = Item.new('2000-12-12', true)
    album.add_item(item2)

    expect(album.items.length).to eq(2)
  end
end
