class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  
  has_many :rates  
  has_many :films, through: :rates
end
