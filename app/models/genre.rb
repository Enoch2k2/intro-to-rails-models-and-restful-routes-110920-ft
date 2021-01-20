class Genre < ApplicationRecord
  has_many :movies

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :movies, reject_if: :all_blank
end
