get '/tags/:tag_id/talks' do # View all talks with specific tag.
  erb :talks_by_tag
end

get '/tags/:tag_id/users' do # View all users that used a specific tag.
  erb :users_by_tag
end
