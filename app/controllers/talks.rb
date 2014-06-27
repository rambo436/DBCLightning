get '/talks' do

  erb :'talks/index'
end

get 'talks/:tid' do
  @talk = Talk.find(params[:tid])

  erb :'/talks/talk'
end

get 'talks/:tid/new' do
  @talk = Talk.find(params[:tid])

  erb :'talks/new'
end

get 'talks/:tid/edit' do
  @talk = Talk.find(params[:tid])

  erb :'talks/edit'
end

put 'talks/:tid' do
  @talk = Talk.find(params[:tid])

  redirect "/talks"
end

delete 'talks/:tid' do
  @talk = Talk.find(params[:tid])

  redirect "/talks"
end
