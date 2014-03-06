class Book < ActiveRecord::Base

  validates :title, :author, :pages, :price, presence: true

  validates :pages, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, unless: "pages.blank?"

  validates :price, numericality: { greater_than_or_equal_to: 0 }, unless: "price.blank?"

end
