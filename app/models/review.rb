class Review < ActiveRecord::Base

  STARS = [1, 2, 3, 4, 5]

  validates :name, :summary, :comment, presence: true

  validates :stars, inclusion: { in: STARS, message: "must be between 1 and 5" }

  belongs_to :book


end
