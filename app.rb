require_relative 'book'
require_relative 'label'

class App
  attr_accessor :books, :labels, :music_albums, :genres, :games, :authors
  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
  end

  def list_books
    @books.each do |book|
      puts book.to_s
    end
  end

  def list_labels
    @labels.each do |label|
      puts label.to_s
    end
  end

  def add_book
    print 'Please, type the book title: '
    title = gets.chomp

    print 'Please, type the book publisher: '
    publisher = gets.chomp

    print 'Please, type the book cover state: '
    cover_state = gets.chomp

    print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = gets.chomp
    return unless publish_date.match?(/\d{4}-\d{2}-\d{2}/)

    print 'Please, type the book label: '
    label = gets.chomp.capitalize

    print 'Please, type the label color: '
    color = gets.chomp.capitalize

    @books.push(Book.new(publisher, cover_state, publish_date, title))

    @labels.push(Label.new(label, color)) unless @labels.any? { |l| l.title == label && l.color == color }
    
    @labels.find { |l| l.title == label && l.color == color }.add_item(@books.last)

    puts 'Book created successfully'
  end

  def list_music_albums; end

  def list_genres; end

  def add_music_album; end

  def list_games; end

  def list_authors; end

  def add_game; end
end
