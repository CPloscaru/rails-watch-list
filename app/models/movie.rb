class Movie < ApplicationRecord
  before_destroy :check_bookmark
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  private

  def check_bookmark
    puts Bookmark.where(movie_id: self.id).count == 1
    if Bookmark.where(movie_id: self.id).count == 1
      # throw :abort
      return ActiveRecord::InvalidForeignKey
    end
  end
end
