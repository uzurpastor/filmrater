class RateParamsCollector
  def self.call(*args)
    new(*args).call
  end

  def initialize(object, user)
    @object = object
    @user = user
  end

  def call
    case @object.class.to_s
    when 'Film::ActiveRecord_Relation'
      collect_from_array(@object)
    when 'Film'
      collect(@object)
    end
      
  end

  private

  def collect_from_array films
    films.map do |film|
      collect(film)
    end.reduce Hash.new, :merge
  end

  def collect(film)
    {"#{film.id}": {rate: rate(film), can_rate?: can_rate?(film)}}
  end

  def rate(film)
    AvarageRateCalc.call(film)
  end

  def can_rate?(film)
    if @user
      @user.can_rate?(film)
    end.present?
  end
end