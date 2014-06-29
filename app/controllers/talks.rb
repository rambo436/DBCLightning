# before do
#   redirect '/' if !current_user
# end

get '/talks/view' do # view all talks
  @talks = Talk.all
  erb :'talks/all_talks'
end

get '/talks' do # view all talks #We removed the /edit preceding
  @talks = Talk.all.order('created_at DESC')
  erb :'talks/all_talks'
end

get '/talks/:talk_id' do #view specific talk #We removed the /edit preceding
  @talk = Talk.find(params[:talk_id])
  @users = User.all
  @tags = @talk.tags
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


post '/submit' do #create a new talk
  event_time = params[:dateof] + ' ' + params[:timeof]
  p params["minrsvp"]
  talk = Talk.create(speaker_id: current_user.id, title: params["title"], description: params["description"], event_time: event_time, min_rsvp: params["min_rsvp"].to_i)
  Event.create(user_id: current_user.id, talk_id: talk.id)
  talk.valid?
  tags = parse_tags(params["tags"]) #array of tag names
  tags.each do |tag|
    current = Tag.where(name: tag).first_or_create
    Hashtag.create(tag_id: current.id, talk_id: talk.id)
  end
  redirect '/talks'
end

put '/talks/:talk_id' do #edit a talk
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

delete '/talks/:talk_id' do #delete a talk
  @talk = Talk.find(params[:talk_id])
  @talk.destroy
  # will handle with ajax/jquery
  redirect "/talks"
end

get '/talks/:talk_id/vote' do
  @talk = Talk.find(params[:talk_id])
  if current_user.events.find_by_talk_id(@talk.id).attending == false
    @talk.update(current_votes: @talk.current_votes + 1)
    current_user.events.find_by_talk_id(@talk.id).update(attending: true)
  elsif current_user.events.find_by_talk_id(@talk.id).attending == true
    @talk.update(current_votes: @talk.current_votes - 1)
    current_user.events.find_by_talk_id(@talk.id).update(attending: false)
  end
  content_type :json
  {attending: current_user.events.find_by_talk_id(@talk.id).attending, votes: @talk.current_votes, min_votes: @talk.min_rsvp}.to_json
end
