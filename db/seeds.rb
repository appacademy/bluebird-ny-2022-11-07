# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# we want to make sure that every time we seed, it's a 'clean' seed, with no duplicate rows in our DB
# We want to destroy the data in the order it 'belongs to'

Like.destroy_all # belongs to Yips and Users
Chirp.destroy_all # belongs to Users
User.destroy_all # can exist on its own

# Users
paloma = User.create!(
  username: "awesome_person", 
  email: "awesome_person@email.com", 
  age: 30, 
  political_affiliation: "JavaScript"
)

stephen = User.create!(
  username: "stephen", 
  email: "stephen@email.com", 
  age: 30, 
  political_affiliation: "Ruby"
)

daniel = User.create!(
  username: "dan_the_man", 
  email: "dan_the_man@email.com", 
  age: 30, 
  political_affiliation: "Ruby"
)

megan = User.create!(
  username: "the_wizard", 
  email: "the_wizard@email.com", 
  age: 30, 
  political_affiliation: "CSS"
)

kin = User.create!(
  username: "kin-da-ka", 
  email: "kin-da-ka@email.com", 
  age: 30, 
  political_affiliation: "Ruby"
)

kyle = User.create!(
  username: "grumpy-kyle", 
  email: "grumpy-kyle@email.com", 
  age: 30, 
  political_affiliation: "JavaScript"
)

spencer = User.create!(
  username: "talk_to_the_hand_spencer", 
  email: "talk_to_the_hand_spencer@email.com", 
  age: 30, 
  political_affiliation: "Ruby"
)

ayce = User.create!(
  username: "ayce_of_spades", 
  email: "ayce_of_spades@email.com", 
  age: 30, 
  political_affiliation: "JavaScript"
)

brad = User.create!(
  username: "beep_boop", 
  email: "beep_boop@email.com", 
  age: 30, 
  political_affiliation: "C++"
)

greta = User.create!(
  username: "adventursaurus", 
  email: "adventursaurus@email.com", 
  age: 30, 
  political_affiliation: "JavaScript"
)

big_company = User.create!(
  username: "instructors_rock", 
  email: "instructors_rock@email.com", 
  age: 30, 
  political_affiliation: "Instructors"
)


# chirps
chirp1 = Chirp.create!(author_id: spencer.id, body: "Please use my messaging app, it's way better than Twitter.")
chirp2 = Chirp.create!(author_id: big_company.id, body: "Hello fellow instructors.")
chirp3 = Chirp.create!(author_id: big_company.id, body: "Have you seen this sweet instructor merch?")
chirp4 = Chirp.create!(author_id: ayce.id, body: "Sweeeeeet.")
chirp5 = Chirp.create!(author_id: kin.id, body: "Kahoots are an opportunity to mess with students.")

chirp6 = Chirp.create!(author_id: stephen.id, body: "impty?!")
chirp7 = Chirp.create!(author_id: kin.id, body: "This is a random quote I found online. -Some person, 2020.")
chirp8 = Chirp.create!(author_id: ayce.id, body: "JavaScript is the best coding language.")

chirp9 = Chirp.create!(author_id: spencer.id, body: "Programmer: A machine that turns coffee into code.")
chirp10 = Chirp.create!(author_id: big_company.id, body: "You're a wizard, instructor.")


# Likes

# kin
Like.create!(liker_id: kin.id, chirp_id: chirp1.id)
Like.create!(liker_id: kin.id, chirp_id: chirp4.id)
Like.create!(liker_id: kin.id, chirp_id: chirp6.id)
Like.create!(liker_id: kin.id, chirp_id: chirp8.id)
Like.create!(liker_id: kin.id, chirp_id: chirp9.id)

# spencer
Like.create!(liker_id: spencer.id, chirp_id: chirp6.id)
Like.create!(liker_id: spencer.id, chirp_id: chirp7.id)
Like.create!(liker_id: spencer.id, chirp_id: chirp8.id)
Like.create!(liker_id: spencer.id, chirp_id: chirp4.id)

# kyle
Like.create!(liker_id: kyle.id, chirp_id: chirp4.id)
Like.create!(liker_id: kyle.id, chirp_id: chirp5.id)
Like.create!(liker_id: kyle.id, chirp_id: chirp8.id)

# ayce
Like.create!(liker_id: ayce.id, chirp_id: chirp5.id)
Like.create!(liker_id: ayce.id, chirp_id: chirp6.id)

# Big Company
Like.create!(liker_id: big_company.id, chirp_id: chirp1.id)
Like.create!(liker_id: big_company.id, chirp_id: chirp4.id)
Like.create!(liker_id: big_company.id, chirp_id: chirp5.id)
Like.create!(liker_id: big_company.id, chirp_id: chirp6.id)
Like.create!(liker_id: big_company.id, chirp_id: chirp7.id)
Like.create!(liker_id: big_company.id, chirp_id: chirp8.id)
Like.create!(liker_id: big_company.id, chirp_id: chirp9.id)