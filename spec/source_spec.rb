require_relative '../lib/classes/source'
require_relative '../lib/classes/movie'
require_relative '../lib/helpers/helpers'

describe Source do
  describe 'Create a new source "Online shop" and add it to a new movie' do
    publish_date = '2022-08-02'
    movie_id = generate_id_for([])
    movie = Movie.new(publish_date, movie_id, archived: false, silet: false)
    source_id = generate_id_for([])
    source = Source.new('Online shop', source_id)
    movie.add_source(source)

    movie_source_name = movie.source.name

    it 'movie should have "Online shop" as source' do
      expect(movie_source_name).to eql('Online shop')
    end

    source_first_item = source.items[0]

    it 'source has movie as first item in list' do
      expect(source_first_item).to eql(movie)
    end

    movie.add_source(source)
    list_length = source.items.length

    it 'items has to keep the same lenght when trying to add the same item' do
      expect(list_length).to eql(1)
    end
  end
end
