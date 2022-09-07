require_relative 'music_album'
require_relative 'options'
class App
  attr_reader :books, :labels, :music_albums, :genres, :games, :authors
  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
  end

  def list_books; end

  def list_labels; end

  def add_book; end

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

# Mandal->Bright, Bright-<silvia, Silvia->Mandal
