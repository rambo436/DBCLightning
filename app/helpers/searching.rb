helpers do

  def count_word_occurance(talk, word)
    # counts how many times a word occurs in a talk
    count = 0
    count += talk.title.split(" ").map{|word| word.downcase }.grep(word).length
    count += talk.description.split(" ").map{|word| word.downcase }.grep(word).length
    count += 1 if talk.speaker.first_name.downcase.include?(word)
    count += 1 if talk.speaker.last_name.downcase.include?(word)
  end

  def rate_talk(talk, query)
    query = params[:search].split(" ").uniq.map { |word| word.downcase } # might want to delete common words like "the" or "and" from the query as they may scew results
    query.map! do |word|
      count_word_occurance(talk, word) # counts occurance of each word in each talk 
    end
    [talk, query.reduce(:+)]  # pairs the talk with a basic score
  end

  def get_relavent_results(query)
    talks = Talks.all
    talks.map { |talk|
      rate_talk(talk, query) # returns and array of the talk and an integer that gauges how relavent it is
    }
    talk_hash = Hash[talks] # turns the multi-dimentional array into a hash
    talk_hash.sort_by { |k, v| v } 
  end

end