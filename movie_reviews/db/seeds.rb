# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = []

30.times do
  title = Faker::Hacker.ingverb + Faker::Hacker.verb + Faker::Hacker.noun
  date = Faker::Date.backward(1514)

  movies << Movie.create(title: title, release_date: date)
end

movies.each do |movie|

  5.times do
    movie.reviews.create(reviewer_name: Faker::Name.name,
                         title: Faker::Hipster.sentence,
                         review_text: Faker::Hacker.say_something_smart,
                         review_date: Faker::Date.backward(365))
  end

end
