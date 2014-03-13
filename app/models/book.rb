class Book < ActiveRecord::Base

  GENRES = ['Sci-Fi', 'Mystery', 'Fantasy', 'Mythology']

  validates :title, :abstract, :author, :pages, :price, :genre, :published_on, presence: true

  validates :abstract, length: { minimum: 15 }, unless: "abstract.blank?"

  validates :pages,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 },
            unless: "pages.blank?"

  validates :price,
            numericality: { greater_than_or_equal_to: 0 },
            if: "!price.blank?"

  validates :image_file_name, allow_blank: true, format: {
    with: /\w+.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }

  validates :genre, inclusion: { in: GENRES }, unless: "genre.blank?"

  scope :bargains, -> { where('price < 10.00') }

  scope :by, ->(author) { where('author = ?', author) }

end
