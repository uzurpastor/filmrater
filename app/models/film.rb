=begin Schema
t.string "title", null: false
t.text "description", null: false
t.string "category", null: false
=end
class Film < ApplicationRecord
  # Associations
  has_many :rates

  # Validations
  validates_presence_of :title, :description, on: :create
  validates_presence_of :category, on: :create, message: 'Film should have category'

  enum category: DbEnumGenerator.from('Animated Fantasy Gangster Science-Fiction Western Sports Mystery Drama Epic')

  def avarage_rate
    count = self.rates.count
    sum   = self.rates.pluck(:rate).reduce(:+)
    (sum/count.to_f).floor(1)
  end
end
