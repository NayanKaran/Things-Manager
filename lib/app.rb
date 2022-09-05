require_relative './helpers/menu_options'
require_relative './helpers/preserve_data'

class App
  def initialize
    @state = {
      books_list: [],
      music_list: [],
      movies_list: [],
      games_list: [],
      genres_list: [],
      labels_list: [],
      authors_list: [],
      sources_list: []
    }
  end

  def options
    [
      # items
      { id: 1, text: 'List all books', method: 'list_all(@state[:books_list], "Books")' },
      { id: 2, text: 'List all music albums', method: 'list_all(@state[:music_list], "Music Album")' },
      { id: 3, text: 'List all movies', method: 'list_all(@state[:movies_list], "Movies")' },
      { id: 4, text: 'List all games', method: 'list_all(@state[:games_list], "Games")' },
      # tags
      { id: 5, text: 'List all genres', method: 'list_all_genres_sources(@state[:genres_list], "genres")' },
      { id: 6, text: 'List all labels', method: 'list_all_label(@state[:labels_list])' },
      { id: 7, text: 'List all authors', method: 'list_all_author(@state[:authors_list])' },
      { id: 8, text: 'List all sources', method: 'list_all_genres_sources(@state[:sources_list], "sources")' },
      # add
      { id: 9, text: 'Add a book', method: 'add_element("Book", @state)' },
      { id: 10, text: 'Add a music album', method: 'add_element("Music Album", @state)' },
      { id: 11, text: 'Add a movie', method: 'add_element("Movie", @state)' },
      { id: 12, text: 'Add a game', method: 'add_element("Game", @state)' },
      { id: 13, text: 'Exit', method: 'exit' }
    ]
  end

  def show_menu
    puts ''
    puts 'Please select one of the following:'
    puts ''
    options.each do |option|
      print "#{option[:id]}) #{option[:text]} \n"
    end
  end

  def run
    show_menu
    puts ''
    print 'Option number: '
    op = gets.chomp.to_i

    if op.positive? && op <= options.length
      options.map do |option|
        instance_eval(option[:method]) if op == option[:id]
      end
    else
      option_not_available
    end

    save_state
  end

  def save_state
    save_data(@state[:books_list], 'books_list')
    save_data(@state[:music_list], 'music_list')
    save_data(@state[:movies_list], 'movies_list')
    save_data(@state[:games_list], 'games_list')
    save_data(@state[:genres_list], 'genres_list')
    save_data(@state[:labels_list], 'labels_list')
    save_data(@state[:authors_list], 'authors_list')
    save_data(@state[:sources_list], 'sources_list')
  end

  def load_data
    elements = %i[books_list
                  music_list
                  movies_list
                  games_list
                  genres_list
                  labels_list
                  authors_list
                  sources_list]

    elements.each do |element|
      @state[element] = recover_data(element.to_s).nil? ? [] : recover_data(element.to_s)
    end
    link_classes
  end

  def link_classes
    @state[:books_list].each do |item|
      add_missing_data(item, @state)
    end
    @state[:movies_list].each do |item|
      add_missing_data(item, @state)
    end
    @state[:games_list].each do |item|
      add_missing_data(item, @state)
    end
    @state[:music_list].each do |item|
      add_missing_data(item, @state)
    end
  end
end
