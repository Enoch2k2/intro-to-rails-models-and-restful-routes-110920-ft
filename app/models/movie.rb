class Movie < ApplicationRecord
  MOVIE_GENRES = ["Fantasy", "Sci-Fi", "Comedy", "Action", "Horror", "Thriller", "Adventure", "Drama", "Documentary"]

  validates :title, presence: true, uniqueness: true

  validate :genre_is_valid?
  
  # length: { in: 3..20 }, inclusion: { in: ["hello", "world"], message: "must include hello world" } unless :contains_both_words


  validate

  private

    def genre_is_valid?
      if self.genre && !MOVIE_GENRES.include?(self.genre)
        self.errors.add(:genre, "must use genre select drop down")
      end
    end

    # def contains_both_words
    #   self.title.include?(/.*hello.*world.*/)
    # end
end
