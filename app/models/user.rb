class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  
  has_many :rates  
  has_many :films, through: :rates

  def can_rate?(film)
    self.film_ids.none?(film.id)    
  end
end
