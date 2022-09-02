class DBEnumGenerator
  def self.from(*args)
    new(*args).from
  end

  def initialize(options)
    @enum_elements = if options.class == String
      options.downcase.split(' ')
    elsif options.class == Array
      options.map(&:downcase)
    end.uniq
  end

  def from
    enum_hash = {}
    @enum_elements.each do |e|
      enum_hash[e] = e
    end
    enum_hash
  end
end