require_relative 'item'
require 'securerandom'

class MusicAlbum < Item
  attr_reader :name, :id, :label, :genre

  def initialize(name, label, genre, publish_date: Time.now, id: SecureRandom.uuid)
    super(Time.now)
    @id = id
    @name = name
    @label = label
    @genre = genre
    @publish_date = publish_date
  end

  def on_spotify(on_spotify: true)
    on_spotify
  end

  def to_json(*_args)
    {
      id: @id,
      name: @name,
      label: @label,
      genre: @genre,
      publish_date: @publish_date,
      archived: @archived
    }.to_json
  end

  private

  def can_be_archived
    super && on_spotify
  end
end
