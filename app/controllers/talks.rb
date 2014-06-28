
get '/talks/view' do # view all talks
 @talk = Talk.all
  erb :'talks/all_talks'
end

get '/talks/view/:talk_id' do #view specific talk
  @talk = Talk.find(params[:talk_id])
  erb :'talks/single_talk'
end

get '/talks' do # view all talks #We removed the /edit preceding
  @talks = Talk.all #talk.user won't work until the migration is pushed
  erb :'talks/all_talks'
end

get '/talks/:talk_id' do #view specific talk #We removed the /edit preceding
  @talk = Talk.find(params[:talk_id])
  erb :'talks/single_talk'
end

get '/talks/:talk_id/edit' do # edit one of your talks #We switched the order of edit and :talk_id
  # Now working with event_time - Armen to lead parsing effort :-)
  @talk = Talk.find(params[:talk_id])
  erb :edit_single_talk
end

# put '/talks/:talk_id' do #We switched the order of edit and :talk_id
#   @talk = Talk.find(params[:talk_id])
#   @talk.update( title:       params[:title],
#                 description: params[:description],
#                 event_time:        #PARSER,
#                 min_rsvp:    params[:min_rsvp] )
#   # will handle with ajax/jquery
#   redirect '' #somewhere
# end

delete '/talks/:talk_id' do
  @talk = Talk.find(params[:talk_id])
  @talk.destroy
  # will handle with ajax/jquery
  redirect "/talks"
end
