require 'json'

def save_books(books)
  JSON.dump(books, File.open('./database/books.json', 'w'))
end

def load_books(books, labels)
  JSON.parse(File.open('./database/books.json', 'r')).each do |book|
    books << Book.new(book['publish_date'], book['id'])
    labels.find { |label| label.id == book['label_id'] }.add_item(books.last)
  end
end

def save_state(app)
  save_labels(app.labels)
  save_books(app.books)
  save_genres(app.genres)
  save_music_albums(app.music_albums)
  save_authors(app.authors)
  save_games(app.games)
end

def load_state(app)
  load_labels(app.labels)
  load_books(app.books, app.labels)
  load_genres(app.genres)
  load_music_albums(app.music_albums)
  load_authors(app.authors)
  load_games(app.games)
end
