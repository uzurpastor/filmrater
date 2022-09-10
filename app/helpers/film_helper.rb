module FilmHelper
  def poster_tag(film)
    blob_poster = if film.poster.attached?
      film.poster
    else
      'no-image-available.jpg'
    end
    image_tag(blob_poster)
  end  

  def filter_tag category
    options = options_for_select(category[:list], category[:active])

    select_tag :category, options, 
      include_blank: true    
  end
end