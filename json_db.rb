require 'json'

def save_books(books)
  JSON.dump(books, File.open('./data/books.json', 'w'))
end

def load_books(books, labels)
  JSON.parse(File.read('./data/books.json')).each do |book|
    books << Book.new(book['publisher'], book['cover_state'], book['publish_date'], book['title'], id: book['id'])
    books.last.move_to_archive if book['archived']
    labels.find { |label| label.id == book['label_id'] }&.add_item(books.last)
  end
rescue Errno::ENOENT
  puts 'No books found'
end

def save_labels(labels)
  JSON.dump(labels, File.open('./data/labels.json', 'w'))
end

def load_labels(labels)
  JSON.parse(File.read('./data/labels.json')).each do |label|
    labels << Label.new(label['title'], label['color'], id: label['id'])
  end
rescue Errno::ENOENT
  puts 'No labels found'
end

def save_music_albums(music_albums)
  JSON.dump(music_albums, File.open('./data/music_albums.json', 'w'))
end

def load_music_albums(app)
  # check if file exists guard clause
  return unless File.exist?('./data/music_albums.json')

  JSON.parse(File.read('./data/music_albums.json')).each do |music_album|
    # get the label with the id of the music album
    label = app.labels.find { |l| l.id == music_album['label'] }
    app.music_albums << MusicAlbum.new(label, music_album['genre'],
                                       publish_date: music_album['publish_date'],
                                       id: music_album['id'])
    app.music_albums.last.move_to_archive if music_album['archived']
  end
end

def save_genres(genres)
  JSON.dump(genres, File.open('./data/genres.json', 'w'))
end

def load_genres(genres)
  # check if file exists
  return unless File.exist?('./data/genres.json')

  JSON.parse(File.read('./data/genres.json')).each do |genre|
    genres << Genre.new(genre['name'], genre['id'])
  end
end

def save_data(app)
  save_music_albums(app.music_albums)
  save_labels(app.labels)
  save_books(app.books)
  save_genres(app.genres)
end

def load_data(app)
  load_labels(app.labels)
  load_books(app.books, app.labels)
  load_genres(app.genres)
  load_music_albums(app)
end
