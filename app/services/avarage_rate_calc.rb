class AvarageRateCalc
  def self.call(*args)
    new(*args).call
  end

  def initialize(film)
    @film = film
  end

  def call
    find_count_of_rates
    find_sum_of_rates
    calc_avarage
  end

  private

  def calc_avarage
    (@sum/@count.to_f).floor(1)
  end

  def find_count_of_rates
    @count = @film.rates.size
  end

  def find_sum_of_rates
    @sum = @film.rates.map(&:rate).reduce(:+)
  end
end