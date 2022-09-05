require_relative 'item'

class Movie < Item
  def initialize(publish_date, id = rand(1..1000), archived: false, silet: false)
    super(publish_date, id, archived: archived)
    @silet = silet
  end

  def can_be_archived?
    super || @silet ? true : false
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'silet' => @silet,
      # inherited
      'id' => id,
      'archived' => @archived,
      'publish_date' => @publish_date,
      'genre' => @genre.id,
      'author' => @author.id,
      'source' => @source.id,
      'label' => @label.id
    }.to_json(*args)
  end

  def self.json_create(object)
    obj = new(object['publish_date'], object['id'], archived: object['archived'], silet: object['silet'])
    obj.genre = object['genre']
    obj.author = object['author']
    obj.label = object['label']
    obj.source = object['source']
    obj
  end
end
