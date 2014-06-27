get '/talks' do
  @talks = Talk.all

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
  @talk.update( title:       params[:title],
                description: params[:description],
                date:        params[:date],
                time:        params[:time],
                min_rsvp:    params[:min_rsvp] )

  tag_parser = params[:tags].gsub(" ", "")
  tag_namess = tag_parser.split("#").find_all{ |word| word.length > 0 }

  @talk.tags.clear
  tag_names.each{ |tag_name| @talk.tags << Tag.find_or_create_by(name: tag_name) }

  redirect "/talks"
end

delete 'talks/:tid' do
  @talk = Talk.find(params[:tid])
  @talk.destroy

  redirect "/talks"
end
