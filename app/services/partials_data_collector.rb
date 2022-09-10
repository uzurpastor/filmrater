class PartialsDataCollector
  def self.call(*args)
    new(*args).call
  end

  def initialize(film, options)
    @film = film
    @options = options
  end

  def call
    {
      film:   @film,
      rate:   rate_params[:rate],
      rated?: rate_params[:rated?] 
    } 
  end

  private

  def rate_params
    @options[:"#{@film.id}"]
  end
end
