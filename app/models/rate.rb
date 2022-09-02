=begin Schema
t.integer "user_id", null: false
t.integer "film_id", null: false
t.integer "rate", null: false
=end
class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :film
  validates_uniqueness_of :film_id, scope: :user_id

end
