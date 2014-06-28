helpers do

  def parse_tags(tags)
     format = tags.gsub(" ", "")
     tag_names = format.split("#").find_all{ |word| word.length > 0 } #[yolo, hi]
  end

  def datetime_am_pm(time)
    if time.strftime("%I:%M%p")[0] == "0"
      return time.strftime("%I:%M%p")[1..-1]
    end
    time.strftime("%I:%M%p")
  end

end
