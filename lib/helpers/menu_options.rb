require_relative 'object_creation'
require_relative 'preserve_data'

def list_all(arr, label)
  puts ''
  puts "List of all #{label}"
  puts 'id | label | author | genre | source'
  puts '____________________________________'
  arr.each do |item|
    print "#{item.id} | "
    print "[#{item.label.color}] "
    print "#{item.label.title} | "
    print "#{item.author.name} "
    print "#{item.author.last_name} | "
    print "#{item.genre.name} | "
    print "#{item.source.name} \n"
  end
  run
end

def loop_method(arr, id)
  object = arr.map do |e|
    return e if e.id == id
  end

  object[0]
end

def add_missing_data(item, data)
  genreobj = loop_method(data[:genres_list], item.genre)
  item.add_genre(genreobj) unless genreobj.nil?

  labelobj = loop_method(data[:labels_list], item.label)
  item.add_label(labelobj) unless labelobj.nil?

  authorobj = loop_method(data[:authors_list], item.author)
  item.add_author(authorobj) unless authorobj.nil?

  sourceobj = loop_method(data[:sources_list], item.source)
  item.add_source(sourceobj) unless sourceobj.nil?
end

def list_all_genres_sources(arr, label)
  puts ''
  puts "List of all #{label}"
  puts 'id | name'
  puts '___________'
  arr.each do |item|
    print "#{item.id} | "
    print "#{item.name} \n"
  end
  run
end

def list_all_label(arr)
  puts ''
  puts 'List of all labels'
  puts 'id | title | color'
  puts '___________'
  arr.each do |item|
    print "#{item.id} | "
    print "#{item.title} | "
    print "#{item.color} \n"
  end
  run
end

def list_all_author(arr)
  puts ''
  puts 'List of all authors'
  puts 'id | name | last name'
  puts '___________'
  arr.each do |item|
    print "#{item.id} | "
    print "#{item.name} | "
    print "#{item.last_name} \n"
  end
  run
end

def add_element(element, state)
  case element
  when 'Movie'
    add_movie_to(state)
  when 'Music Album'
    add_music_album_to(state)
  when 'Book'
    add_book_to(state)
  when 'Game'
    add_game_to(state)
  else
    raise NoMethodError, "There's no method for this option"
  end
  run
end

def exit
  puts 'Thanks for using this App'
end

def option_not_available
  puts 'That is not a valid option, please select an available option'
  run
end

def add_movie_to(state)
  movie_id = generate_id_for(state[:movies_list])
  new_movie = create_movie(movie_id, state)
  state[:movies_list] << new_movie
  add_to_state(new_movie, state)
end

def add_music_album_to(state)
  music_album_id = generate_id_for(state[:music_list])
  new_album = create_music(music_album_id, state)
  state[:music_list] << new_album
  add_to_state(new_album, state)
end

def add_book_to(state)
  book_id = generate_id_for(state[:books_list])
  new_book = create_book(book_id, state)
  state[:books_list] << new_book
  add_to_state(new_book, state)
end

def add_game_to(state)
  game_id = generate_id_for(state[:games_list])
  new_game = create_game(game_id, state)
  state[:games_list] << new_game
  add_to_state(new_game, state)
end

def add_to_state(item, state)
  state[:authors_list] << item.author
  state[:genres_list] << item.genre
  state[:sources_list] << item.source
  state[:labels_list] << item.label
end
