require 'faker'


50.times{Talk.create(user_id: rand(1..User.all.size), tag_id: rand(1..Tag.all.size), title: Faker::Company.bs, description: Faker::Company.bs, vote: rand(1..30), min_vote: rand(5..15), max_capacity: rand(5..60))}
# Note I left date and time NULL temporarily.

User.create(first_name: "Ben", last_name: "Brostoff", email: "ben.brostoff@gmail.com", password_hash: "test")
User.create(first_name: "Brendan", last_name: "Susens-Jackson", email: "bsusensjackson@gmail.com" , password_hash: "test")
User.create(first_name: "Armen", last_name: "Vartan", email: "vartan.armen@gmail.com", password_hash: "test")
User.create(first_name: "Kai", last_name: "Prout", email: "kaiprt@gmail.com", password_hash: "test")
User.create(first_name: "Natalie", last_name: "Baer", email: "ncbaer@gmail.com", password_hash: "test")
User.create(first_name: "Katie", last_name: "Reiner", email: "kreiner@umich.edu", password_hash: "test")
User.create(first_name: "Lexi", last_name: "Ernst", email: "ldernst@umich.edu", password_hash: "test")
User.create(first_name: "Ken", last_name: "Mendonca", email: "mendoca.kr@gmail.com", password_hash: "test")
User.create(first_name: "Drew", last_name: "Teter", email: "mteter13@gmail.com" , password_hash: "test")

