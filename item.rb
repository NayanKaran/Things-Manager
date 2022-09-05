require 'securerandom'

class Item
  attr_reader :label, :genre, :author, :publish_date, :archived, :id

  def initialize(publish_date)
    @id = SecureRandom.uuid
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    @archived
  end

  def move_to_archive
    @archived = true
  end

  private :can_be_archived?
end
