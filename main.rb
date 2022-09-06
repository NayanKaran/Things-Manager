require_relative 'modules/options'
require_relative 'modules/app'

puts 'Welcome to My Catalog'

def main(app)
  puts "\n\nPlease choose an option by entering a number:"
  input = nil

  while input != 13
    Options.options
    input = App.extract_input(Options::RANGE)
    app.operation(input)
  end
end

app = App::Catalog.new

main(app)
