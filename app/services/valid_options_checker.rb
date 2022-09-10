class ValidOptionsChecker
  def self.call(*args)
    new(*args).call
  end

  def initialize(options, checking_options)
    @options = options
    @checking_options = checking_options
  end

  def call
    @checking_options.each do |option|
      @options.fetch(option)
    end
  end
end