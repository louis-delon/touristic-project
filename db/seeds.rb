# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  Sector.destroy_all
  cities = %i(Rome Berlin Paris)

  puts "create sectors"

  10.times do
    s = Sector.new(
      name: Faker::Lorem.word,
      city: cities.sample,
      description: Faker::Lorem.sentence
    )
    s.save!(validate: false)
    s.illustration.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'paris.jpeg')), filename: 'paris.jpeg')
    s.save!
  end
  puts "successfull creating sectors"

end
