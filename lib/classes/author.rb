class Author
  attr_accessor :items
  attr_reader :id, :name, :last_name

  def initialize(name, last_name, id = rand(1..1000))
    @id = id
    @name = name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      id: id,
      name: @name,
      last_name: @last_name
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['name'], object['last_name'], object['id'])
  end
end
