module BooksHelper
  def formatted_time(time)
    time.strftime('%B %d, %Y at %l:%M %p')
  end

  def image_for(book)
    file_name = book.image_file_name.blank? ? 'placeholder.png' : book.image_file_name
    image_tag(file_name, class: 'img-rounded')
  end

  def format_average_stars(book)
    average = number_with_precision(book.average_stars, precision: 1)
    if average
      pluralize(average, 'star')
    else
      content_tag(:strong, 'No reviews')
    end
  end
end
