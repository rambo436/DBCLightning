enable :sessions

get "/login" do
  erb :"users/login"
end

post "/login" do
  @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
  if @user
    session[:user] = @user
    redirect "users/#{}"
  else
    "Nice try hacker"
  end
end

get "/signup" do
  #
  erb :"users/signup"
end

post "/signup" do

  redirect "/login"
end

get "/logout" do
  session.clear

  erb :"users/logout"
end




