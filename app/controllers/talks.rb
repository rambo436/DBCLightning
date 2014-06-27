get '/talks' do # view all talks #We removed the /edit preceding
  @talks = Talk.all
  erb :all_talks
end

get '/talks/:talk_id' do #view specific talk #We removed the /edit preceding
  @talk = Talk.find(params[:talk_id])
  erb :'talks/single_talk'
end

get '/talks/:talk_id/edit' do # edit one of your talks #We switched the order of edit and :talk_id

  erb :edit_single_talk
end

put '/talks/:talk_id' do #We switched the order of edit and :talk_id

  # will handle with ajax/jquery
  redirect '' #somewhere
end

delete '/talks/:talk_id' do
  # will handle with ajax/jquery
  redirect ''
end
