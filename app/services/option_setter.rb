class OptionSetter
  def initialize(film, user, params = nil)
    @film = film
    @user = user
    @params = params
    @options = {}
  end

  def options(options = {})
    case options
    when Symbol
      add_rate_params if options == :rate_params
    when Array
      add_rate_params if options.include?(:rate_params)        
      add_category if options.include?(:category)        
    end
      
  end

  private

  def add_rate_params
    @options.merge!(rate_params: collect_rate_params)
  end

  def collect_rate_params
    RateParamsCollector.call(@film, @user)    
  end

  def add_category
    @options.merge!(category: collect_category_opt )    
  end

  def collect_category_opt
    category = {}
    category.merge!(list: Film.categories.values)
    category.merge!(active: @params[:category] || '')
  end
end
