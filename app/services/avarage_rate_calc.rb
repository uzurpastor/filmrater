class AvarageRateCalc
  def self.call(*args)
    new(*args).call
  end

  def initialize(film, options = {})
    @film = film
    @options = options
  end

  def call
    return 0.0 unless alredy_rated? 
    find_count_of_rates
    find_sum_of_rates
    calc_avarage(hash: @options[:hash])
  end

  private

  def alredy_rated?
    @film.rates.size.nonzero?
  end

  def calc_avarage(hash: false)
    av = (@sum/@count.to_f).floor(1)
    case hash.present?
    when false
      av
    when true
      { "#{@film.id}": av }
    end
  end

  def find_count_of_rates
    @count = @film.rates.size
    return 0 if @count.zero?
  end

  def find_sum_of_rates
    @sum = @film.rates.map(&:rate).reduce(:+)
  end
end