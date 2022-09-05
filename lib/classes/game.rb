require_relative './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, publish_date, archived, id = rand(1..1000))
    super(publish_date, id, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = Date.strptime(last_played_at, '%Y-%m-%d')
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => id,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'publish_date' => publish_date,
      'genre' => @genre.id,
      'author' => @author.id,
      'source' => @source.id,
      'label' => @label.id,
      'archived' => archived
    }.to_json(*args)
  end

  def self.json_create(object)
    multiplayer = object['multiplayer']
    last_played_at = object['last_played_at']
    publish_date = object['publish_date']
    archived = object['archived']
    id = object['id']

    obj = new(multiplayer, last_played_at, publish_date, archived, id)
    obj.genre = object['genre']
    obj.author = object['author']
    obj.label = object['label']
    obj.source = object['source']
    obj
  end

  private

  def can_be_archived?
    super && @last_played_at < Date.new(Date.today.year - 2, Date.today.month, Date.today.day)
  end
end
