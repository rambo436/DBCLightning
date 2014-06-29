# before do
#   redirect '/' if !current_user
# end

get '/talks/view' do # view all talks
  @talks = Talk.all
  erb :'talks/all_talks'
end

get '/talks/view/:talk_id' do #view specific talk
  @talk = Talk.find(params[:talk_id])
  erb :'talks/single_talk'
end

get '/talks' do # view all talks #We removed the /edit preceding
  @talks = Talk.all.order('created_at DESC') #talk.user won't work until the migration is pushed
  erb :'talks/all_talks'
end

get '/talks/:talk_id' do #view specific talk #We removed the /edit preceding
  @talk = Talk.find(params[:talk_id])
  erb :'talks/single_talk'
end

get '/talks/:talk_id/edit' do # edit one of your talks #We switched the order of edit and :talk_id
  # Now working with event_time - Armen to lead parsing effort :-)
  @talk = Talk.find(params[:talk_id])
  p @tags = @talk.tags #array of tag objects
  @tag_names = []
  @tags.each do |tag|
    p @tag_names << ("#" + tag.name)
  end
  @tag_names = @tag_names.join(" ")
  erb :'/talks/edit_single_talk'
end


post '/submit' do#testing handle
  event_time = params[:dateof] + ' ' + params[:timeof]
  p talk = Talk.create(speaker_id: current_user.id, title: params["title"], description: params["description"], event_time: event_time, min_rsvp: params["min_rsvp"]) #need to pass input
  p talk.valid?
  tags = parse_tags(params["tags"]) #array of tag names
  tags.each do |tag|
    current = Tag.create(name: tag)
    Hashtag.create(tag_id: current.id, talk_id: talk.id)
  end
  redirect '/talks'
end

put '/talks/:talk_id' do #We switched the order of edit and :talk_id
  @talk = Talk.find(params[:talk_id])
  @talk.update( title: params[:title],
  description: params[:description],
  event_time:  params[:dateof] + " " + params[:timeof],
  min_rsvp:    params[:min_rsvp] )
  tags = parse_tags(params["tags"]) #array of tag names
  tags.each do |tag|
    unless Tag.where(name: tag).nil?
      object_tag = Tag.create(name: tag)
      Hashtag.create(talk_id: @talk.id, tag_id: object_tag.id)
    else
      Hashtag.create(talk_id: @talk.id, tag_id: Tag.find_by(name: tag).id)
    end
    redirect '/talks'
  end
end

delete '/talks/:talk_id' do
  @talk = Talk.find(params[:talk_id])
  @talk.destroy
  # will handle with ajax/jquery
  redirect "/talks"
end

get '/talks/:talk_id/vote' do
  @talk = Talk.find(params[:talk_id])
  @talk.update(current_votes: @talk.current_votes + 1)
  content_type :json
  {votes: @talk.current_votes, min_votes: @talk.min_rsvp}.to_json
end
