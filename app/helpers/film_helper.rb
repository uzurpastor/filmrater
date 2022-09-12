module FilmHelper
  def film_registrate_password_lable
    label_tag :password do
      minimum = "(#{@minimum_password_length} characters minimum)" if @minimum_password_length        
      'Password ' + minimum.html_safe
    end
  end

  def form_film_submit(action, options = {})
    submit_tag action, options
  end

  def description_text(film, action_name)
    if action_name != 'show'    
      film.description.truncate_words(15)
    else
      film.description
    end
  end

  def show_link(film, action_name, options = {})
    if action_name != 'show'    
      link_to 'show', film_path(film), options
    end
  end

  def render_rate_form(options)
    if options[:can_rate?] 
     render 'rates/new', local_options: {
          film: options[:film]
        }
    else
      tag.span('You can rate the film', class: 'text-muted')
    end 
  end

  def poster_tag(film, options = {})
    blob_poster = if film.poster.attached?
      film.poster
    else
      asset_path('no-image-available.jpg')
    end
    image_tag(blob_poster, options)
  end  

  def filter_tag(category, options = {})
    options_list = options_for_select(category[:list], category[:active])

    select_tag :category, options_list, 
      options.merge(include_blank: true)
  end
end