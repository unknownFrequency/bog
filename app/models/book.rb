class Book < ActiveRecord::Base
  GENRES = %w(Fiktion Filosofi Religion Natur)

  mount_uploader :book_img, BookImgUploader

  validates :title, :abstract, :author, :pages, :price, :genre, presence: true

  validates :abstract, length: { minimum: 15 }, unless: 'abstract.blank?'

  validates :pages,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 },
            unless: 'pages.blank?'

  validates :price,
            numericality: { greater_than_or_equal_to: 0 },
            if: '!price.blank?'

  validates :genre, inclusion: { in: GENRES }, unless: 'genre.blank?'

  scope :bargains, -> { where('price < 10.00') }

  scope :by, ->(author) { where('author = ?', author) }

  has_many :reviews, dependent: :destroy

  def average_stars
    if reviews.loaded?
      reviews.map(&:stars).average
    else
      reviews.average(:stars)
    end
  end

  def recent_reviews(recent_count = 2)
    reviews.order('created_at desc').limit(recent_count)
  end
end
