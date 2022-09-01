User.create!( email: 'user@mail.com',
              password: 'passwd',
              password_confirmation: 'passwd')

# Admin user
User.create!( email: 'admin@mail.com',
              admin: true,
              password: 'passwd',
              password_confirmation: 'passwd')