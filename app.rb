require_relative 'music_album'
require_relative 'options'
require_relative 'book'
require_relative 'label'
require_relative 'game'
require_relative 'author'
require_relative './json_db'

class App
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
      puts "[#{index}] ID: #{music_album.id}, Name: #{music_album.name},
      Label: #{music_album.label}, Genre: #{music_album.genre}"
    end
  end

  def list_genres
    puts 'No genres yet' if @genres.empty?
    @genres.each_with_index do |genre, index|
      puts "[#{index}] ID: #{genre.id}, Name: #{genre.name}"
    end
  end

  def add_music_album
    name, label, genre = Options.new.get_music_album_options(@labels, @genres)
    if genre.is_a?(Genre)
      @genres << genre unless @genres.include?(genre)
      genre = @genres.last
    else
      genre = @genres.find { |g| g.id == genre }
    end
    music_album = MusicAlbum.new(name, label, genre.name)

    if @music_albums << music_album
      puts 'Awesome! Your new music album is ready.'
    else
      puts 'Sorry! Something went wrong.'
    end
  end

  def list_games
    puts 'Games list is empty! Add a game.' if @games.empty?
    @games.each_with_index do |game, index|
      s = "Last played at: #{game.last_played_at} - published: #{game.publish_date}"
      p "#{index}) Mulitiplayer: #{game.mulitiplayer} - " + s
    end
  end

  def add_authors()
    init = []
    author_names = ['Stephen King', 'Charles Dickens', 'James Fenimore Cooper']
    author_names.each do |author|
      first_name = author.split[0]
      last_name = author.split[1]
      init << Author.new(first_name, last_name)
    end
    init
  end

  def list_authors
    authors = add_authors
    puts 'Author list is empty! Add a author.' if authors.empty?
    authors.each_with_index do |author, index|
      p "#{index}) #{author.first_name} #{author.last_name}"
    end
  end

  def add_game
    print 'Mulitiplayer: '
    mplayer = gets.chomp
    print 'Last played at: '
    last_played_at = gets.chomp
    print 'Published: '
    published = gets.chomp
    game = Game.new(mplayer, last_played_at, published)
    @games << game
    puts "Game #{mplayer} created successfully."
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
