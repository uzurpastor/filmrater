=begin Schema
t.string "title", null: false
t.text "description", null: false
t.string "category", null: false
=end
class Film < ApplicationRecord
  # Associations
  has_many :rates
  has_one_attached :poster
  # Validations
  validates_presence_of :title, :description
  validates_presence_of :category, message: 'Film should have category'

  # Scopes
  scope :by_category, -> (category) do 
    if category.blank?
      all
    else
      where(category: category)
    end
  end

  enum category: DbEnumGenerator.from('Animated Fantasy Gangster Science-Fiction Western Sports Mystery Drama Epic')

end
