helpers do 

  def parse_tags(tags)
     format = tags.gsub(" ", "")
     tag_names = format.split("#").find_all{ |word| word.length > 0 } #[yolo, hi]
  end

  def datetime_parse
  end

end