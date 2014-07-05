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

post '/search' do
  @results = get_relavent_results(params[:search]).keys # ranks all talks in order of relavence
  @results = @results[0..4] # returns top 5 results
  erb :search
end




