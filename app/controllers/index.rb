get '/' do
  # Look in app/views/index.erb
  redirect "/users/signin"
end

get '/about' do
  erb :about
end
