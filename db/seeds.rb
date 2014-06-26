require 'faker'

50.times{Talk.create(user_id: rand(1..User.all.size), tag_id: rand(1..Tag.all.size), title: Faker::Company.bs, description: Faker::Company.bs, vote: rand(1..30), min_vote: rand(5..15), max_capacity: rand(5..60))}
# Note I left date and time NULL temporarily.
