helpers do

  def em(text)
    "<em>#{text}</em>"
  end

  def link(route, text)
  	'<a href="/' + route + '">' + text + '</a>'
	end

end