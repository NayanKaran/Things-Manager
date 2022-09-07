module Authors
  def list_authors
    authors = add_authors
    puts 'Author list is empty! Add a author.' if authors.empty?
    authors.each_with_index do |author, index|
      p "#{index}) #{author.first_name} #{author.last_name}"
    end
  end

  def add_authors()
    init = []
    author_names = ['Stephen King', 'Charles Dickens', 'James Fenimore Cooper']
    author_names.each do |author|
      first_name = author.split[0]
      last_name = author.split[1]
      init << Author.new(first_name, last_name)
    end
    init
  end
end