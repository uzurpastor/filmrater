class FilmsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_film,           except: %i[index new create]

  #======= Read Actions =======#
  def show
    @options = OptionSetter.new(@film, current_user)
                           .options(:rate_params)
  end

  def index
    @films = FilmSetter.list(params)
    @options = OptionSetter.new(@films, current_user, params)
                           .options(%i[rate_params category])
  end

  #======= Create Actions =======#
  def new
    return redirect_to films_path unless safety?

    @film = Film.new
    render 'films/new'
  end

  def create
    return unless safety?

    @film = Film.new(FilmsParamsPermitter.create(params))
    if @film.save
      redirect_to films_path,
        flash: { success: "Film \"#{@film.title}\" created" }
    else
      render 'new', status: :unprocessable_entity
    end
  end

  #======= Update Actions =======#
  def edit
    return redirect_to films_path unless safety?

    render 'films/edit'
  end

  def update
    return unless safety?

    if @film.update(FilmsParamsPermitter.update(params))
      redirect_to film_path(@film),
        flash: {success: "Film \"#{@film.title}\" updated"}
    else
      render 'films/edit', status: :unprocessable_entity
    end
  end

  #======= Destroy Action =======#
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
end
