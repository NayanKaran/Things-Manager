require_relative '../lib/app'

def main
  puts 'Hello, Welcome to our App!'
  app = App.new
  app.load_data
  app.run
end

main
