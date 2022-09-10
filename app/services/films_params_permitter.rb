class FilmsParamsPermitter
  def self.create(*args)
    new(*args).create
  end

  def self.update(*args)
    new(*args).update
  end

  def initialize(params)
    @params = params
  end

  def create
    @params.require(:film).permit(:title, :description, :category, :poster)
  end

  def update
    @params.require(:film).permit(:title, :description, :category, :poster)
  end

end