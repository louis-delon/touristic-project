# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  Sector.destroy_all
  Site.destroy_all
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


  # puts "create sites"

  # 10.times do
  #   s = Site.new(
  #     title: Faker::Lorem.word,
  #     opening_time: Time.zone.now,
  #     description: Faker::Lorem.sentence,
  #     phone_number: Faker::PhoneNumber.phone_number,
  #     website: Faker::Internet.url,
  #     category: rand(1..3),
  #     active: Faker::Boolean.boolean(true_ratio: 0.8)
  #   )
  #   s.save!(validate: false)
  #   s.picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'paris.jpeg')), filename: 'paris.jpeg')
  # end
end
