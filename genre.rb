require 'securerandom'

class Genre
  attr_reader :name, :items, :id

  def initialize(name, id = SecureRandom.uuid)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(*_args)
    {
      id: @id,
      name: @name
    }.to_json
  end
end
