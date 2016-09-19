class Review < ActiveRecord::Base

  STARS = 1..5

  validates :summary, :comment, presence: true

  validates :comment,
            length: { minimum: 10, message: 'Mindst 10 tegn, tak.' },
            unless: 'comment.blank?'

  #validates :stars, inclusion: { in: STARS,
  #  message: "must be between #{STARS.first} and #{STARS.last}" }

  belongs_to :book

end
