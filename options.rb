require_relative 'app'
require_relative 'genre'
require_relative 'label'

class Options
  def get_music_album_options(labels, genres)
    label = get_label_options(labels)
    genre = get_genre_options(genres)

    [label, genre]
  end

  def get_label_options(labels) # rubocop:disable Metrics/MethodLength
    if labels.empty?
      puts 'Enter the label title of the music album:'
      title = gets.chomp
      puts 'Enter the label color of the music album:'
      color = gets.chomp
      labels << Label.new(title, color)
    else
      puts 'Choose a label from the list or select # to create one:'
      labels.each_with_index do |label, index|
        puts "[#{index}] #{label}"
      end
      label = gets.chomp
      if label == '#'
        puts 'Enter the label title of the music album:'
        title = gets.chomp
        puts 'Enter the label color of the music album:'
        color = gets.chomp
        label = Label.new(title, color)
        labels << label
      else
        label = labels[label.to_i]
      end
    end
    label
  end

  def get_genre_options(genres)
    # choose a genre if there are any else create a new one
    if genres.empty?
      puts 'Enter the genre of the music album:'
      genre = Genre.new(gets.chomp)
    else
      puts 'Choose a genre from the list or select # to add a new one:'
      genres.each_with_index do |this_genre, index|
        puts "[#{index}] #{this_genre.name}"
      end
      genre = gets.chomp
      if genre == '#'
        puts 'Enter the genre of the music album:'
        genre = Genre.new(gets.chomp)
      else
        genre = genres[genre.to_i]
      end
    end
    genre
  end
end
