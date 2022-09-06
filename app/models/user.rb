class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  
  has_many :rates  
  has_many :films, through: :rates

  def rated?(film)
    self.film_ids.include?(film.id)    
  end
end
