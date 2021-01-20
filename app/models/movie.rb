class Movie < ApplicationRecord

  validates :title, presence: true
  belongs_to :genre

  accepts_nested_attributes_for :genre, reject_if: :all_blank

  def genre_name
    self.genre ? self.genre.name : "Genre not available"
  end

end
