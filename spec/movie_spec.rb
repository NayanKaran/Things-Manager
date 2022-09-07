require_relative '../lib/classes/movie'

describe Movie do
  describe 'Create a new movie older than 10 years but not silet' do
    movie = Movie.new('2002-08-02', archived: false, silet: false)

     end

  describe 'Create a new movie not older than 10 years but silet' do
    movie = Movie.new('2022-08-02', archived: false, silet: true)

      end

  describe 'Create a new movie older than 10 yeard and silet' do
    movie = Movie.new('2002-08-02', archived: false, silet: true)

   
  end

  describe 'Create a movie not older than 10 years and not silet' do
    movie = Movie.new('2022-08-02', archived: false, silet: false)

    
   end
end
