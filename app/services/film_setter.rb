class FilmSetter
  def self.certain(*args)
    new(*args).certain
  end

  def self.list(*args)
    new(*args).list
  end

  def initialize(params)
    @params = params
  end

  def certain
    case @params[:controller]
    when 'films' 
      Film.find(@params[:id])
    when 'rates'
      Film.find(@params[:rate][:film_id])
    end
      
  end

  def list
    Film.by_category(@params[:category])
        .order(id: :desc)
        .page(@params[:page])
        .includes(:rates, :poster_blob)
  end
end