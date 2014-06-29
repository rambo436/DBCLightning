get '/' do
  # Look in app/views/index.erb
  if logged_in?
    redirect '/talks'
  else
    redirect "/users/signin"
  end
end

get '/about' do
  erb :about
end
