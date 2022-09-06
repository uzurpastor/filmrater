class AvarageRateCalc
  def self.call(*args)
    new(*args).call
  end

  def initialize(film)
    @film = film
  end

  def call
    return 0.0 unless alredy_rated? 
    find_count_of_rates
    find_sum_of_rates
    calc_avarage
  end

  private

  def alredy_rated?
    @film.rates.size.nonzero?
  end

  def calc_avarage
    av = (@sum/@count.to_f).floor(1)
    { "#{@film.id}": av }
  end

  def find_count_of_rates
    @count = @film.rates.size
    return 0 if @count.zero?
  end

  def find_sum_of_rates
    @sum = @film.rates.map(&:rate).reduce(:+)
  end
end