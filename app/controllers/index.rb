get '/' do
  redirect "/users/signin"
end

get '/about' do
  erb :about
end
