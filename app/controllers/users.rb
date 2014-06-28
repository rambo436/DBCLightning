enable :sessions

get '/users/signin' do
  erb :"users/sign_in"
end

post '/users/signin' do
  @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
  if @user
    session[:user] = @user
    redirect '/talks/view'
  else
    @invalid_login = true
    erb :"users/sign_in"
  end
end

get '/users/:id/new_talk' do
  @user = User.find(params[:id])
  erb :"users/new_talk"
end

get '/users/edit/:id' do #to change password

  erb :"users/edit"
end

put '/users/edit' do #keep eye on this!

  redirect '/'
end

get '/users/:id' do # User views another users profile
  @user = User.find(params[:id])
  @talks= Talk.where(speaker_id: @user.id).order('created_at DESC')
  erb :"users/view_other_user"
end

get '/signout' do
  session.clear
  redirect '/'
end
