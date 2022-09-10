require_relative 'item'
require 'securerandom'

class MusicAlbum < Item
  attr_reader :id, :label, :genre, :on_spotify, :publish_date

  def initialize(on_spotify, publish_date, id: SecureRandom.uuid)
    super(publish_date)
    @id = id
    @on_spotify = on_spotify
  end

  def to_json(*_args)
    {
      id: @id,
      label_id: @label.id,
      genre_id: @genre.id,
      author_id: @author.id,
      on_spotify: @on_spotify,
      publish_date: @publish_date,
      archived: @archived
    }.to_json
  end

  private

  def can_be_archived
    super && on_spotify
  end
end
