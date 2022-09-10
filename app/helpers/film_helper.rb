module FilmHelper
  def poster(film)
    blob_poster = if film.poster.attached?
      film.poster
    else
      'no-image-available.jpg'
    end
    image_tag(blob_poster)
  end  

  def filter_tag list, active
    options = options_for_select(list, active)

    select_tag :category, options, 
      include_blank: true    
  end
end