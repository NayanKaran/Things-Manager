require 'json'

def save_books(books)
  JSON.dump(books, File.open('./data/books.json', 'w'))
end

def load_books(app)
  JSON.parse(File.read('./data/books.json')).each do |book|
    books << Book.new(book['publisher'], book['cover_state'], book['publish_date'], id: book['id'])
    books.last.move_to_archive if book['archived']
    app.labels.find { |label| label.id == book['label_id'] }&.add_item(books.last)
    app.genres.find { |genre| genre.id == book['genre_id'] }&.add_item(books.last)
    app.authors.find { |author| author.id == book['author_id'] }&.add_item(books.last)
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
  JSON.parse(File.read('./data/music_albums.json')).each do |music_album|
    app.music_albums << MusicAlbum.new(music_album['on_spotify'], music_album['publish_date'], id: music_album['id'])
    app.music_albums.last.move_to_archive if music_album['archived']
    app.labels.find { |label| label.id == music_album['label_id'] }&.add_item(app.music_albums.last)
    app.genres.find { |genre| genre.id == music_album['genre_id'] }&.add_item(app.music_albums.last)
    app.authors.find { |author| author.id == music_album['author_id'] }&.add_item(app.music_albums.last)
  end
rescue Errno::ENOENT
  puts 'No music albums found'
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

def save_authors(authors)
  JSON.dump(authors, File.open('./data/authors.json', 'w'))
end

def load_authors(authors)
  JSON.parse(File.read('./data/authors.json')).each do |author|
    authors << Author.new(author['first_name'], author['last_name'], id: author['id'])
  end
  rescue Errno::ENOENT
    puts 'No authors found'
end

def save_games(games)
  JSON.dump(games, File.open('./data/games.json', 'w'))
end

def load_games(app)
  JSON.parse(File.read('./data/games.json')).each do |game|
    app.games << Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'], id: game['id'])
    app.games.last.move_to_archive if game['archived']
    app.labels.find { |label| label.id == game['label_id'] }&.add_item(app.games.last)
    app.genres.find { |genre| genre.id == game['genre_id'] }&.add_item(app.games.last)
    app.authors.find { |author| author.id == game['author_id'] }&.add_item(app.games.last)
  end
rescue Errno::ENOENT
  puts 'No games found'
end

def save_data(app)
  save_labels(app.labels)
  save_authors(app.authors)
  save_genres(app.genres)
  save_books(app.books)
  save_music_albums(app.music_albums)
  save_games(app.games)
end

def load_data(app)
  load_labels(app.labels)
  load_genres(app.genres)
  load_authors(app.authors)
  load_books(app)
  load_music_albums(app)
  load_games(app)
end
