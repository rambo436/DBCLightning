require 'faker'
# Note I left date and time NULL temporarily.
# Ben
User.create(first_name: "Ben", last_name: "Brostoff", email: "ben.brostoff@gmail.com", password: "test", password_confirmation: "test")
User.create(first_name: "Brendan", last_name: "Susens-Jackson", email: "bsusensjackson@gmail.com" , password: "test", password_confirmation: "test")
User.create(first_name: "Armen", last_name: "Vartan", email: "vartan.armen@gmail.com", password: "test", password_confirmation: "test")
User.create(first_name: "Kai", last_name: "Prout", email: "kaiprt@gmail.com", password: "test", password_confirmation: "test")
User.create(first_name: "Natalie", last_name: "Baer", email: "ncbaer@gmail.com", password: "test", password_confirmation: "test")
User.create(first_name: "Katie", last_name: "Reiner", email: "kreiner@umich.edu", password: "test", password_confirmation: "test")
User.create(first_name: "Lexi", last_name: "Ernst", email: "ldernst@umich.edu", password: "test", password_confirmation: "test")
User.create(first_name: "Ken", last_name: "Mendonca", email: "mendoca.kr@gmail.com", password: "test", password_confirmation: "test")
User.create(first_name: "Drew", last_name: "Teter", email: "mteter13@gmail.com" , password: "test", password_confirmation: "test")

# Kai
50.times{ Talk.create(speaker_id: rand(1..User.all.size), title: Faker::Company.bs, description: Faker::Company.bs, min_rsvp: rand(5..15))}

# Armen
tag_names = ["Math", "Politics", "Meta-skills", "Ruby", "Python", "JavaScript",
  "Pyschology", "Engineering Empathy", "Machine Code", "Other Languages", "Other"]
tag_names.each{ |tag| Tag.create(name: tag) }

# Creating joins
# Hashtags
talks = Talk.all
tags = Tag.all
100.times{ Hashtag.create(talk_id: rand(1..talks.size), tag_id: rand(1..tags.size)) }
# Events
talks = Talk.all
users = User.all
talks.each do |talk|
  users.each do |user|
    Event.create(user_id: user.id, talk_id: talk.id, attending: [true, false].sample)
  end
end
