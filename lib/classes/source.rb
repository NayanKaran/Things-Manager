class Source
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name, id = rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.source = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'name' => name,
      'id' => id
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['name'], object['id'])
  end
end
