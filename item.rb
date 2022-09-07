<<<<<<< HEAD
=======
require 'securerandom'
>>>>>>> af372d7598f49788ef6605aa67e87e5ab22e2cec
require 'date'

class Item
  attr_accessor :genre, :author, :source, :label
  attr_reader :id, :publish_date, :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    Time.now.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    label.items << self unless label.items.include?(self)
  end

<<<<<<< HEAD
  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
=======
  def can_be_archived?
    Date.strptime(@publish_date, '%Y-%m-%d') < DateTime.now.prev_year(10)
>>>>>>> af372d7598f49788ef6605aa67e87e5ab22e2cec
  end
end
