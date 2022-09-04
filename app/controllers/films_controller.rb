class FilmsController < ApplicationController
  before_action :set_film,  only: %i[show edit destroy]
  before_action :set_films, only: :index
  
  def show
    render 'films/show'
  end

  def index
    render 'films/index'
  end

  # ability for admin
  def new
    @film = Film.new
    render 'films/new'
  end

  def create
    @film = Film.new(film_create_params)
    if @film.save
      redirect_to films_path,
        flash: { success: "Film \"#{@film.title}\" created" }
    else
      render 'new', status: :unprocessable_entity
    end
  end


  def edit
    render 'films/edit'
  end

  def update
  end

  def destroy 
    if @film.destroy
      redirect_to films_path,
        flash: { success: "Film \"#{@film.title}\" successfuly deleted" }
    else
      redirect_to film_path,
        flash: { danger: 'unknow problem' }
    end
  end
  # end

  private

  def set_film
    @film = Film.find params[:id]    
  end

  def set_films
    @films = Film.all.select(:id, :title, :description, :category).includes(:rates)
    @rates = @films.map do |film|
      AvarageRateCalc.call(film)
    end
  end

  def film_create_params
    params.require(:film).permit(:title, :description, :category)
  end
end
