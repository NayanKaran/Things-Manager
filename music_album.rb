require_relative 'item'
require 'securerandom'

class MusicAlbum < Item
  attr_reader :id, :label, :genre, :on_spotify, :publish_date

  def initialize(label, genre, publish_date: Time.now, id: SecureRandom.uuid)
    super(Time.now)
    @id = id
    @label = label
    @genre = genre
    @on_spotify = true
    @publish_date = publish_date
  end

  def to_json(*_args)
    {
      id: @id,
      label: @label.id,
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
