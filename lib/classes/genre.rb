class Genre
  attr_accessor :items
  attr_reader :id, :name

  def initialize(name, id = rand(1..1000))
    @name = name
    @id = id
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'name' => @name,
      'id' => @id
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['name'], object['id'])
  end
end
