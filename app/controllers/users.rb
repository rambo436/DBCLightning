enable :sessions

get '/user/signin' do
  erb :"users/sign_in"
end

post '/user/signin' do
  @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
  if @user
    session[:user] = @user
    redirect '/talks/view'
  else
    "Nice Try Hackers!"
  end
end

get '/user/edit/:id' do #to change password

  erb :"users/edit"
end

put '/user/edit' do #keep eye on this!

  redirect
end

get '/user/view/:id' do # User views another users profile

  erb :"users/view_other_user"
end

get '/signout' do

  session.clear
  redirect '/'
end
