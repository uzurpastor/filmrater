User.create!( email: 'user@mail.com',
              password: 'passwd',
              password_confirmation: 'passwd')

# Admin user
User.create!( email: 'admin@mail.com',
              admin: true,
              password: 'passwd',
              password_confirmation: 'passwd')

# Users
30.times do
  name      = Faker::Name.first_name
  email     = Faker::Internet.free_email name: name
  password  = Faker::Internet.password min_length: 6
  User.create( email: email,
               password: password,
               password_confirmation: password)
end

# Films
100.times do 
  title = Faker::Movie.title
  description = Faker::Lorem.paragraph sentence_count: 15
  category = Film.categories.keys.sample

  Film.create!( title: title,
                description: description,
                category: category)
end

# Rates
films = Film.all
users = User.all
700.times do 
  film = films.sample 
  user = users.sample
  rate = SecureRandom.random_number(1..10)
  u = user.rates.create( film_id: film.id, rate: rate)
  u.save
end
