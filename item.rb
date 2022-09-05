require 'securerandom'

class Item
    attr_reader :label, :genre, :author, :publish_date, :archived, :id
    def initialize(publish_date)
        @id = SecureRandom.uuid
        @publish_date = publish_date
        @archived = false
    end
    def set_genre(genre)
        @genre = genre
    end
    def set_author(author)
        @author = author
    end
    def set_label(label)
        @label = label
    end

    def can_be_archived?
        return @archived
    end

    def move_to_archive
        @archived = true
    end

    private :can_be_archived?
end