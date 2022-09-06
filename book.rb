require_relative 'item'

class Book < Item
  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end
  def can_be_archived?
    super && @cover_state == 'bad'
  end
  def to_json(*_args)
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived,
      publisher: @publisher,
      cover_state: @cover_state,
      label_id: @label.id
    }.to_json
  end
  private :can_be_archived?
end