class BookPhoto < ActiveRecord::Base
  belongs_to :book
  mount_uploader :photo, PhotoUploader

end
