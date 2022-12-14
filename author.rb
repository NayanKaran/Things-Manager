require 'securerandom'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name, id: SecureRandom.uuid)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    items << item
    item.author = self
  end

  def to_json(*_args)
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
    }.to_json
  end
end
