class FilmsController < ApplicationController
  before_action :set_film,  only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]

  #======= Read Actions
  def show
    @options = OptionSetter.new(@film, current_user)
                           .options(:rate_params)
  end

  def index
    @films = FilmSetter.list(params)
    @options = OptionSetter.new(@films, current_user, params)
                           .options(%i[rate_params category])
  end

  #======= Create Actions
  def new
    return redirect_to films_path unless safety?

    @film = Film.new
    render 'films/new'
  end

  def create
    return unless safety?

    @film = Film.new(film_create_params)
    if @film.save
      redirect_to films_path,
        flash: { success: "Film \"#{@film.title}\" created" }
    else
      render 'new', status: :unprocessable_entity
    end
  end

  #======= Update Actions
  def edit
    return redirect_to films_path unless safety?

    render 'films/edit'
  end

  def update
    return unless safety?

    if @film.update(film_update_params)
      redirect_to film_path(@film),
        flash: {success: "Film \"#{@film.title}\" updated"}
    else
      render 'films/edit', status: :unprocessable_entity
    end
  end

  #======= Destroy Action
  def destroy 
    return unless safety?
    
    if @film.destroy
      redirect_to films_path,
        flash: { success: "Film \"#{@film.title}\" successfuly deleted" }
    else
      redirect_to film_path,
        flash: { danger: 'unknow problem' }
    end
  end

  private
    
    def set_film
      @film = FilmSetter.certain(params)
    end

    def film_create_params
      params.require(:film).permit(:title, :description, :category, :poster)
    end

    def film_update_params
      params.require(:film).permit(:title, :description, :category, :poster)
    end
end
