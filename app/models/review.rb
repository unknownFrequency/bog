class Review < ActiveRecord::Base

  STARS = 1..5

  validates :summary, :comment, presence: true

  validates :comment,
            length: { minimum: 15, message: 'should have a bit more than that! (at least 15 characters)' },
            unless: 'comment.blank?'

  #validates :stars, inclusion: { in: STARS,
  #  message: "must be between #{STARS.first} and #{STARS.last}" }

  belongs_to :book

end
