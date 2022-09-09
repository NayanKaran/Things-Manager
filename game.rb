require_relative './item'
require 'securerandom'

class Game < Item
  attr_accessor :mulitiplayer, :last_played_at

  def initialize(mulitiplayer, last_played_at, publish_date, id: SecureRandom.uuid)
    super(publish_date)
    @id = id
    @mulitiplayer = mulitiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && Date.strptime(@last_played_at, '%Y-%m-%d') < DateTime.now.prev_year(2)
  end

  def to_json(*_args)
    {
      id: @id,
      label_id: @label.id,
      genre_id: @genre.id,
      author_id: @author.id,
      mulitiplayer: @mulitiplayer,
      last_played_at: @last_played_at,
      publish_date: @publish_date,
      archived: @archived
    }.to_json
  end
end
