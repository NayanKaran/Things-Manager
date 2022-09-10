require_relative 'app'

def main
  print "Welcome to the Things manager app!\n"
  app = App.new
  app.run
  print 'Thank you for using this app!'
end

main
