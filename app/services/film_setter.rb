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
    Film.find(@params[:id])
  end

  def list
    Film.by_category(@params[:category])
        .page(@params[:page])
        .includes(:rates, :poster_blob)
  end
end