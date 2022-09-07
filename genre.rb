require 'securerandom'

class Genre 
  attr_reader :name, :items, :id
  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end