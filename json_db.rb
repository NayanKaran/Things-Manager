require 'json'

def save_books(books)
  JSON.dump(books, File.open('./database/books.json', 'w'))
end

def load_books(books, labels)
  JSON.parse(File.read('./database/books.json')).each do |book|
    books << Book.new(book['publisher'], book['cover_state'], book['publish_date'], book['title'], id: book['id'])
    books.last.move_to_archive if book['archived']
    labels.find { |label| label.id == book['label_id'] }&.add_item(books.last)
  end
rescue Errno::ENOENT
  puts 'No books found'
end

def save_labels(labels)
  JSON.dump(labels, File.open('./database/labels.json', 'w'))
end

def load_labels(labels)
  JSON.parse(File.read('./database/labels.json')).each do |label|
    labels << Label.new(label['title'], label['color'], id: label['id'])
  end
rescue Errno::ENOENT
  puts 'No labels found'
end

def save_music_albums(music_albums)
  JSON.dump(music_albums, File.open('./database/music_albums.json', 'w'))
end

def load_music_albums(music_albums)
  # check if file exists guard clause
  return unless File.exist?('./database/music_albums.json')

  JSON.parse(File.read('./database/music_albums.json')).each do |music_album|
    music_albums << MusicAlbum.new(
      music_album['name'], music_album['label'], music_album['genre'],
      publish_date: music_album['publish_date'],
      id: music_album['id']
    )
    music_albums.last.move_to_archive if music_album['archived']
  end
end

def save_genres(genres)
  JSON.dump(genres, File.open('./database/genres.json', 'w'))
end

def load_genres(genres)
  # check if file exists
  return unless File.exist?('./database/genres.json')

  JSON.parse(File.read('./database/genres.json')).each do |genre|
    genres << Genre.new(genre['name'], genre['id'])
  end
end

def save_state(app)
  save_music_albums(app.music_albums)
  save_labels(app.labels)
  save_books(app.books)
  save_genres(app.genres)
end

def load_state(app)
  load_labels(app.labels)
  load_books(app.books, app.labels)
  load_genres(app.genres)
  load_music_albums(app.music_albums)
end
