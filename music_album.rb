require_relative 'item'
require 'securerandom'

class Music_Album < Item
  attr_reader :artist, :tracks, :name, :price, :id, :label, :genre
  def initialize(name, price, artist, tracks, label, genre, publish_date = Time.now)
    super(Time.now)
    @id = SecureRandom.uuid
    @name = name
    @price = price
    @label = label
    @genre = genre
    @artist = artist
    @tracks = tracks
  end

  def on_spotify
    true
  end
  
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name,
      'price' => @price,
      'artist' => @artist,
      'tracks' => @tracks,
      'publish_date' => @publish_date,
      'archived' => @archived
    }.to_json(*args)
  end

  private
  def can_be_archived
    super && on_spotify
  end

  
end