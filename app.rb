require_relative 'music_album'
require_relative 'options'
require_relative 'book'
require_relative 'label'
require_relative 'game'
require_relative 'author'
require_relative './json_db'

class App # rubocop:disable Metrics
  attr_accessor :books, :labels, :music_albums, :genres, :games, :authors

  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
    @exit = false
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

  def add_book # rubocop:disable Metrics
    print 'Please, type the label title of the book: '
    label = gets.chomp.capitalize
    print 'Please, type the label color of the book: '
    color = gets.chomp.capitalize
    print 'Please, type the book publisher: '
    publisher = gets.chomp
    print 'Please, type the book cover state: '
    cover_state = gets.chomp
    print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = gets.chomp
    return unless publish_date.match?(/\d{4}-\d{2}-\d{2}/)

    print 'Please, type the first name of the author: '
    first_name = gets.chomp.capitalize
    print 'Please, type the second name of the author: '
    second_name = gets.chomp.capitalize
    print 'Please, type the genre of the book: '
    genre = gets.chomp.capitalize
    @books.push(Book.new(publisher, cover_state, publish_date))
    @labels.push(Label.new(label, color)) unless @labels.any? { |l| l.title == label && l.color == color }
    @labels.find { |l| l.title == label && l.color == color }.add_item(@books.last)
    @authors.push(Author.new(first_name, second_name)) unless @authors.any? do |a|
                                                                a.first_name == first_name && a.last_name == second_name
                                                              end
    @authors.find { |a| a.first_name == first_name && a.last_name == second_name }.add_item(@books.last)
    @genres.push(Genre.new(genre)) unless @genres.any? { |g| g.name == genre }
    @genres.find { |g| g.name == genre }.add_item(@books.last)
    puts 'Book created successfully'
  end

  def list_music_albums
    puts 'No music albums yet' if @music_albums.empty?
    @music_albums.each_with_index do |music_album, index|
      puts "[#{index}] ID: #{music_album.id}, Label title: #{music_album.label.title}, Genre name: #{music_album.genre.name}"
    end
  end

  def list_genres
    puts 'No genres yet' if @genres.empty?
    @genres.each_with_index do |genre, index|
      puts "[#{index}] ID: #{genre.id}, Name: #{genre.name}"
    end
  end

  def add_music_album
    print 'Please, type the label title of the music album: '
    label = gets.chomp.capitalize
    print 'Please, type the label color of the music album: '
    color = gets.chomp.capitalize
    print 'Please, type the music album genre: '
    genre = gets.chomp.capitalize
    print 'is it on spotify? [y/n]: '
    spotify = gets.chomp == 'y'
    print 'Please, type the music album author first name: '
    first_name = gets.chomp.capitalize
    print 'Please, type the music album author last name: '
    last_name = gets.chomp.capitalize
    print 'Please, type the publish date of the music album: '
    publish_date = gets.chomp
    @music_albums.push(MusicAlbum.new(spotify, publish_date))
    @labels.push(Label.new(label, color)) unless @labels.any? { |l| l.title == label && l.color == color }
    @labels.find { |l| l.title == label && l.color == color }.add_item(@music_albums.last)
    @genres.push(Genre.new(genre)) unless @genres.any? { |g| g.name == genre }
    @genres.find { |g| g.name == genre }.add_item(@music_albums.last)
    @authors.push(Author.new(first_name, last_name)) unless @authors.any? { |a| a.first_name == first_name && a.last_name == last_name }
    @authors.find { |a| a.first_name == first_name && a.last_name == last_name }.add_item(@music_albums.last)
    puts 'Music album created successfully'
  end

  def list_games
    puts 'Games list is empty! Add a game.' if @games.empty?
    @games.each_with_index do |game, index|
      s = "Last played at: #{game.last_played_at} - published: #{game.publish_date}"
      p "#{index}) Mulitiplayer: #{game.mulitiplayer} - " + s
    end
  end

  def list_authors
    @authors.each_with_index do |author, index|
      puts "[#{index}] ID: #{author.id}, First name: #{author.first_name}, Last name: #{author.last_name}"
    end
  end

  def add_game
    print 'Please, type the label title of the game: '
    label = gets.chomp.capitalize
    print 'Please, type the label color of the game: '
    color = gets.chomp.capitalize
    print 'Please, type the game genre: '
    genre = gets.chomp.capitalize
    print 'Please, type the game author first name: '
    first_name = gets.chomp.capitalize
    print 'Please, type the game author last name: '
    last_name = gets.chomp.capitalize
    print 'Please, type the publish date of the game: '
    publish_date = gets.chomp
    print 'Is it multiplayer? [y/n]: '
    multiplayer = gets.chomp == 'y'
    print 'Please, type the last played date of the game: '
    last_played_at = gets.chomp
    @games.push(Game.new(multiplayer, last_played_at, publish_date))
    @labels.push(Label.new(label, color)) unless @labels.any? { |l| l.title == label && l.color == color }
    @labels.find { |l| l.title == label && l.color == color }.add_item(@games.last)
    @genres.push(Genre.new(genre)) unless @genres.any? { |g| g.name == genre }
    @genres.find { |g| g.name == genre }.add_item(@games.last)
    @authors.push(Author.new(first_name, last_name)) unless @authors.any? { |a| a.first_name == first_name && a.last_name == last_name }
    @authors.find { |a| a.first_name == first_name && a.last_name == last_name }.add_item(@games.last)
    puts 'Game created successfully'
  end

  def print_options
    options = ['List all books',
               'List all music albums',
               'List of games',
               "List all genres (e.g 'Comedy', 'Thriller')",
               "List all labels (e.g. 'Gift', 'New')",
               "List all authors (e.g. 'Stephen King')",
               'Add a book',
               'Add a music album',
               'Add a game',
               'Save & Exit']
    puts 'Please choose an option by entering a number:'
    options.each_with_index do |option, index|
      puts "#{index + 1} - #{option}"
    end
  end

  def execute_option(option) # rubocop:disable Metrics
    return list_books if option == 1
    return list_music_albums if option == 2
    return list_games if option == 3
    return list_genres if option == 4
    return list_labels if option == 5
    return list_authors if option == 6
    return add_book if option == 7
    return add_music_album if option == 8
    return add_game if option == 9
    return exit if option == 10

    puts 'Invalid option'
  end

  def run
    load_data(self)
    while @exit == false
      print_options
      execute_option(gets.chomp.to_i)
    end
    save_data(self)
  end

  def exit
    @exit = true
  end
end
