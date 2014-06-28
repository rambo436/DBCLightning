get '/' do
  # Look in app/views/index.erb
  redirect "/users/signin"
end

post '/submit' do#testing handler
  "#{params}"
end