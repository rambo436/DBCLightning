get '/talks/view' do # view all talks

  erb :'talks/all_talks'
end

get '/talks/view/:talk_id' do #view specific talk

  erb :'talks/single_talk'
end

get '/talks/edit/:talk_id' do # edit one of your talks

  erb :'talks/edit_single_talk'
end

put  '/talks/edit/:talk_id' do

  # will handle with ajax/jquery
  redirect '' #somewhere
end

delete '/talks/:talk_id' do
  # will handle with ajax/jquery
  redirect ''
end
