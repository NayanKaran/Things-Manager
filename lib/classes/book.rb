require_relative './item'

class Book < Item
  attr_reader :publisher, :cover_state, :id, :archived

  def initialize(publisher, cover_state, publish_date, archived, id = rand(1..1000))
    super(publish_date, id, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      publisher: @publisher,
      cover_state: @cover_state,
      # inherited
      id: id,
      publish_date: publish_date,
      archived: archived,
      label: @label.id,
      source: @source.id,
      author: @author.id,
      genre: @genre.id
    }.to_json(*args)
  end

  def self.json_create(object)
    publisher = object['publisher']
    cover_state = object['cover_state']
    publish_date = object['publish_date']
    archived = object['archived']
    id = object['id']

    obj = new(publisher, cover_state, publish_date, archived, id)
    obj.genre = object['genre']
    obj.author = object['author']
    obj.label = object['label']
    obj.source = object['source']
    obj
  end
end
