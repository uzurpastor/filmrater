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
    render 'films/new'
  end

  def create
  end


  def edit
    render 'films/edit'
  end

  def update
  end

  def destroy 
    debugger
    redirect_to films_path
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
end
