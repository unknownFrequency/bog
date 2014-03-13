module BooksHelper

  def formatted_time(time)
    time.strftime("%B %d, %Y at %l:%M %p")
  end

  def image_for(book)
    if book.image_file_name.blank?
      image_tag('placeholder.png')
    else
      image_tag(book.image_file_name)
    end
  end

end