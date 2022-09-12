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
      can_rate?: rate_params[:can_rate?] 
    } 
  end

  private

  def rate_params
    @options[:"#{@film.id}"]
  end
end
