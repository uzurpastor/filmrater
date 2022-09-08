=begin Schema
t.integer "user_id", null: false
t.integer "film_id", null: false
t.integer "rate", null: false
=end
class Rate < ApplicationRecord

  # Associations
  belongs_to :user
  belongs_to :film

  # Validations
  validates_uniqueness_of :film_id, scope: :user_id, message: 'already rated'
  validate :rate_score, on: :create

  private
  
  def rate_score
    score = self.rate
    unless (1..10).include?(score) 
      errors.add(:rate, 'should to be between 1 and 10')
    end
  end
end
