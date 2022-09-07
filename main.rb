require_relative 'modules/options'
require_relative 'modules/app'

puts 'Welcome to My Catalog'

def execute_option(option, app) # rubocop:disable Metrics
  case option
  when '1'
    app.list_books
  when '2'
    app.list_music_albums
  when '3'
    app.list_games
  when '4'
    app.list_genres
  when '5'
    app.list_labels
  when '6'
    app.list_authors
  when '7'
    app.add_book
  when '8'
    if app.add_music_album
      puts 'Awesome! Your new music album is ready.'
    else
      puts 'Sorry! Something went wrong.'
    end
  when '9'
    app.add_game
  when '10'
    return true
  else
    puts 'Invalid option'
  end
  false
end

  while input != 13
    Options.options
    input = App.extract_input(Options::RANGE)
    app.operation(input)
  end
end

app = App::Catalog.new

main(app)
