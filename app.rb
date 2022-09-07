require_relative 'music_album'
require_relative 'options'
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

  def list_music_albums
    puts 'No music albums yet' if @music_albums.empty?
    @music_albums.each_with_index do |music_album, index|
      puts "[#{index}] ID: #{music_album.id}, Date:#{music_album.publish_date}, Name: #{music_album.name}, Price: #{music_album.price}, Artist: #{music_album.artist}, Tracks: #{music_album.tracks}, Label: #{music_album.label}, Genre: #{music_album.genre}"
    end
  end

  def list_genres;
    puts 'No genres yet' if @genres.empty?
    @genres.each_with_index do |genre, index|
      puts "[#{index}] ID: #{genre.id}, Name: #{genre.name}"
    end
  end

  def add_music_album; 
    name, price, artist, tracks, label, genre = Options.new.get_music_album_options(@labels, @genres)
    # if genre is an object add it to the genres array else get the genre object from the genres array
    if genre.is_a?(Genre)
      @genres << genre unless @genres.include?(genre)
      genre = @genres.last
    else
      genre = @genres.find { |g| g.id == genre }
    end
    music_album = Music_Album.new(name, price, artist, tracks, label, genre.name)
    
    if @music_albums << music_album 
      return true
    else
      return false
    end
  end

  def list_games; end

  def list_authors; end

  def add_game; end
end
