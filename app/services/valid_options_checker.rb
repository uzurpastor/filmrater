class ValidOptionsChecker
  def self.call(*args)
    new(*args).call
  end

  def initialize(options, checking_options)
    @options = options
    @checking_options = checking_options
  end

  def call
    case @checking_options
    when Array
      check_array(@checking_options)
    when Symbol
      check(@checking_options)
    end
  end

  private

  def check(opt)
    @options.fetch(opt)
  end

  def check_array(opts)
    opts.each do |opt|
      check(opt)
    end
  end
end