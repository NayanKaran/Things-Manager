require_relative 'app'
require_relative 'genre'

class Options
  def get_music_album_options(labels, genres) 
    puts "Enter the name of the music album:"
    name = gets.chomp
    puts "Enter the price of the music album:"
    price = gets.chomp
    puts "Enter the artist of the music album:"
    artist = gets.chomp
    puts "Enter the number of tracks of the music album:"
    tracks = gets.chomp

    # choose a lable if there are any else create a new one
    if labels.empty?
      puts "Enter the label of the music album:"
      label = gets.chomp
      labels << label
    else
      puts "Choose a label from the list or select # to create one:"
      labels.each_with_index do |label, index|
        puts "[#{index}] #{label}"
      end
      label = gets.chomp
      if label == '#'
        puts "Enter the label of the music album:"
        label = gets.chomp
        labels << label
      else
        label = labels[label.to_i]
      end
    end

    # choose a genre if there are any else create a new one
    if genres.empty?
      puts "Enter the genre of the music album:"
      genre = Genre.new(gets.chomp)
    else
      puts "Choose a genre from the list or select # to add a new one:"
      genres.each_with_index do |genre, index|
        puts "[#{index}] #{genre}"
      end
      genre = gets.chomp
      if genre == '#'
        puts "Enter the genre of the music album:"
        genre = Genre.new(gets.chomp)
      else
        genre = genres[genre.to_i]
      end
    end
   return name, price, artist, tracks, label, genre
  end
end