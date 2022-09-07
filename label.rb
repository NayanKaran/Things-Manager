require 'securerandom'

class Label
  attr_reader :title, :color, :id, :items

  def initialize(title, color, id: SecureRandom.uuid)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(*_args)
    {
      id: @id,
      title: @title,
      color: @color
    }.to_json
  end

  def to_s
    "Label: title = #{@title}, color = #{@color}"
  end
end
