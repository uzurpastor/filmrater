class FilmsController < ApplicationController
  before_action :set_film,  only: %i[show edit update destroy]
  before_action :set_films, only: :index
  before_action :authenticate_user!, except: [:index, :show]

  # START Read Actions
  def show
    @rate = AvarageRateCalc.call(@film)
    render 'films/show'
  end

  def index
    render 'films/index'
  end
  # END Read Actions

  # START Create Actions
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
  # END Create Actions

  # START Update Actions
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
  # END Update Actions

  # START Destroy Action
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
  # END Destroy Action

  private

  def set_film
    @film = Film.find params[:id]
  end

  def set_films
    @films = eval <<-FILM_SELECT.delete("\n")
                  Film
                    #{category_condition}
                    .page(params[:page])
                    .includes(:rates, :poster_blob)
                  FILM_SELECT
    @rates = collect_rates
    if current_user
      @rated_film_ids = current_user.film_ids
    end
  end

  def category_condition
    @filtering_category = params[:category] || ''
    '.' + params[:category] if @filtering_category.present?
  end

  def collect_rates
    @films.map do |film|
      AvarageRateCalc.call(film, hash: true)
    end.reduce Hash.new, :merge
  end

  def film_create_params
    params.require(:film).permit(:title, :description, :category, :poster)
  end

  def film_update_params
    params.require(:film).permit(:title, :description, :category, :poster)
  end
end
