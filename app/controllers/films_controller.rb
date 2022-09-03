class FilmsController < ApplicationController
  before_action :set_film,  only: %i[show edit destroy]
  before_action :set_films, only: :index
  
  def show
    render 'films/show'
  end

  def index
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
  end
  # end

  private

  def set_film
    @film = Film.find params[:id]    
  end

  def set_films
    @films = Film.all    
  end
end
