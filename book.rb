require_relative 'item'
require 'json'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, id: SecureRandom.uuid)
    super(publish_date)
    @id = id
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*_args)
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived,
      publisher: @publisher,
      cover_state: @cover_state,
      label_id: @label&.id,
      genre_id: @genre&.id,
      author_id: @author&.id
    }.to_json
  end

  def to_s
    "Book: publisher = #{@publisher}, " \
      "cover_state = #{@cover_state}, publish_date = #{@publish_date}, " \
      "archived = #{@archived}, label_title = #{@label&.title}, " \
      "label_color = #{@label&.color}, " \
      "author = #{@author&.first_name} #{@author&.last_name}, " \
      "genre = #{@genre&.name}"
  end
  private :can_be_archived?
end
