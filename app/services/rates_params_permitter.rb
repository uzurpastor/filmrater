class RatesParamsPermitter
  def self.create(*args)
    new(*args).create
  end

  def initialize(params)
    @params = params
  end

  def create
    @params.require(:rate).permit(:film_id, :rate) 
  end
end