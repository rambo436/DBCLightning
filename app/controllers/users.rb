get '/user/signin' do

  erb :sign_in
end

post '/user/signin/:id' do

  redirect ''
end

get '/user/edit/:id' do #to change password

  erb :edit
end

put '/user/edit' do #keep eye on this!

  redirect
end

get '/user/view/:id' do # User views another users profile

  erb :view_other_user
end

get '/signout' do

  session.clear
  redirect '/'
end
