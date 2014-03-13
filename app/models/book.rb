class Book < ActiveRecord::Base

  validates :title, :author, :pages, :price, presence: true

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

  scope :bargains, -> { where('price < 10.00') }

  scope :by, ->(author) { where('author = ?', author) }

end
