require_relative 'item'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify, id = rand(1..1000), archived: false)
    super(publish_date, id, archived: archived)
    @on_spotify = on_spotify
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'on_spotify' => on_spotify,
      # inherited
      'id' => id,
      'publish_date' => publish_date,
      'archived' => @archived,
      'genre' => genre.id,
      'author' => author.id,
      'label' => label.id,
      'source' => source.id
    }.to_json(*args)
  end

  def self.json_create(object)
    obj = new(object['publish_date'], object['on_spotify'], object['id'], archived: object['archived'])
    obj.genre = object['genre']
    obj.author = object['author']
    obj.label = object['label']
    obj.source = object['source']
    obj
  end

  private

  def can_be_archived?
    super && @on_spotify ? true : false
  end
end
