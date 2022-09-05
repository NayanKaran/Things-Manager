class Book
  def to_json(*_args)
    {
      label_id: @label.id,
      id: @id,
      publish_date: @publish_date
    }.to_json
  end
end
