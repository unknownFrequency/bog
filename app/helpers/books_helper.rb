module BooksHelper
  def formatted_time(time)
    time.strftime('%B %d, %Y at %l:%M %p')
  end

  # def image_for(book)
  #   file_name = book.image_file_name.blank? ? 'placeholder.png' : book.image_file_name
  #   image_tag(file_name, class: 'img-rounded')
  # end

  def format_average_stars(book)
    average = number_with_precision(book.average_stars, precision: 1)
    if average
      average + ' stjerner'
    else
      content_tag(:span, 'Ingen anmeldelser', { class: 'reviews' })
    end
  end

  def star_pics(avarage)
    if avarage.to_int < 1.5
      content_tag(:span, image_tag('1_star.png', size: "100x30"))
    elsif avarage.to_int > 1.5 && avarage.to_int < 2.5
      content_tag(:span, image_tag('2_star.png', size: "100x30"))
    elsif avarage.to_int > 2.5 && avarage.to_int < 3.5
      content_tag(:span, image_tag('3_star.png', size: "100x30"))
    elsif avarage.to_int > 3.5 && avarage.to_int < 4.5
      content_tag(:span, image_tag('4_star.png', size: "100x30"))
    elsif avarage.to_int > 4.5 
      content_tag(:span, image_tag('5_star.png', size: "100x30"))
    end
  end

end
