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
  @talks = Talk.where("title like?", "%#{params["search"]}%")
  @search = params["search"]
  erb :search
end

def count_word_occurance(talk, word)
  count = 0
  count += talk.title.split(" ").map{|word| word.downcase }.grep(word).length
  count += talk.description.split(" ").map{|word| word.downcase }.grep(word).length
  count += 1 if talk.speaker.first_name.downcase.include?(word)
  count += 1 if talk.speaker.last_name.downcase.include?(word)
end

def something(talk, query)
  query = params[:search].split(" ").uniq.map { |word| word.downcase }
  query.map! do |word|
    count_word_occurance(talk, word)
  end
  [talk, query.reduce(:+)]
end

def get_relavent_results(query)
  talks = Talks.all
  talks.map { |talk|
    something(talk, query)
  }
  talk_hash = Hash[talks]
  talk_hash.sort_by { |k, v| v }
end

# For each talk
  # For each word in query
    # counts how many times a word appears in...
      # title
      # description
      # user.first_name
      # user.last_name
    # end
    # sum the occurances of each word
  # end
  # sum occurances of all words
# end
# sort talks




