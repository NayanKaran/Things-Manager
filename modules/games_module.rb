module Games
  def list_games
    puts 'Games list is empty! Add a game.' if @games.empty?
    @games.each_with_index do |game, index|
      s = "Last played at: #{game.last_played_at} - published: #{game.publish_date}"
      p "#{index}) Mulitiplayer: #{game.mulitiplayer} - " + s
    end
  end

  def add_game
    print 'Mulitiplayer: '
    mplayer = gets.chomp
    print 'Last played at: '
    last_played_at = gets.chomp
    print 'Published: '
    published = gets.chomp
    game = Game.new(mplayer, last_played_at, published)
    @games << game
    puts "Game #{mplayer} created successfully."
  end
end
