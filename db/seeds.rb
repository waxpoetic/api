# frozen_string_literal: true

user = User.create!(
  name: 'Tom Scott',
  email: 'tubbo@psychedeli.ca'
)
puts "API Token: '#{user.password}'"

user.articles.create!(
  title: 'Test Article',
  body: 'It Works'
)

wonderbars = Artist.create!(
  name: 'The Wonder Bars'
)

wonderbars.releases.create!(
  name: 'The Wonder Bars',
  catalog_number: 'WXP007'
)
