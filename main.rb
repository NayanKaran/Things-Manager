# Create a main.rb file that will serve as your console app entry-point.
# Implement startup actions:
# Present the user with a list of options to perform.
# Let users choose an option.
# If needed, ask for parameters for the option.
# Have a way to quit the app.
require_relative 'app'
require_relative './json_db'

def print_options
  options = ['List all books',
             'List all music albums',
             'List of games',
             "List all genres (e.g 'Comedy', 'Thriller')",
             "List all labels (e.g. 'Gift', 'New')",
             "List all authors (e.g. 'Stephen King')",
             'Add a book',
             'Add a music album',
             'Add a game',
             'Exit']
  puts 'Please choose an option by entering a number:'
  options.each_with_index do |option, index|
    puts "#{index + 1} - #{option}"
  end
end

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
    app.add_music_albums
  when '9'
    app.add_game
  when '10'
    return true
  else
    puts 'Invalid option'
  end
  false
end

def main
  puts 'Welcome to the Things manager app!'
  puts
  app = App.new
  load_state(app)
  exit = false
  while exit == false
    print_options
    exit = execute_option(gets.chomp, app)
  end
  save_state(app)
  puts 'Thank you for using this app!'
end

main
