get '/talks' do

  erb :'talks/index'
end

get 'talks/:tid' do

  erb :'/talks/talk'
end

get 'talks/:tid/new' do

  erb :'talks/new'
end

get 'talks/:tid/edit' do

  erb :'talks/edit'
end

put 'talks/:tid' do

  redirect "/talks"
end

delete 'talks/:tid' do

  redirect "/talks"
end
